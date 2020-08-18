package opa

import (
	"bytes"
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"sort"
	"text/template"

	"github.com/accurics/terrascan/pkg/utils"
	"github.com/open-policy-agent/opa/ast"
	"github.com/open-policy-agent/opa/rego"

	"go.uber.org/zap"
)

// NewPolicy returns a new OPA policy
func NewPolicy() (*Policy, error) {
	policy := &Policy{
		context: context.Background(),
	}
	return policy, nil
}

// Init initializes the Opa policy
func (p *Policy) Init(policyPath string) error {
	_, err := os.Stat(policyPath)
	if err != nil {
		return err
	}
	p.path = policyPath
	return nil
}

// GetRules Returns a list sorted in lexicographical order for more consistent output
func (p *Policy) GetRules() []*Rule {
	ruleList := make([]*Rule, len(p.ruleMap))
	i := 0
	for k := range p.ruleMap {
		ruleList[i] = p.ruleMap[k]
		i++
	}
	return ruleList
}

// loadRegoMetadata Loads rego metadata from a given file
func (p *Policy) loadRegoMetadata(metaFilename string) (*RegoMetadata, error) {
	// Load metadata file if it exists
	metadata, err := ioutil.ReadFile(metaFilename)
	if err != nil {
		if !errors.Is(err, os.ErrNotExist) {
			zap.S().Error("failed to load rego metadata", zap.String("file", metaFilename))
		}
		return nil, err
	}

	// Read metadata into struct
	regoMetadata := RegoMetadata{}
	if err = json.Unmarshal(metadata, &regoMetadata); err != nil {
		zap.S().Error("failed to unmarshal rego metadata", zap.String("file", metaFilename))
		return nil, err
	}
	return &regoMetadata, err
}

// loadRawRegoFilesIntoMap imports raw rego files into a map
func (p *Policy) loadRawRegoFilesIntoMap(currentDir string, regoDataList []*Rule, regoFileMap *map[string][]byte) error {
	for i := range regoDataList {
		regoPath := filepath.Join(currentDir, regoDataList[i].Metadata.File)
		rawRegoData, err := ioutil.ReadFile(regoPath)
		if err != nil {
			zap.S().Debug("failed to load rego file", zap.String("file", regoPath))
			continue
		}

		// Load the raw rego into the map
		_, ok := (*regoFileMap)[regoPath]
		if ok {
			// Already loaded this file, so continue
			continue
		}

		(*regoFileMap)[regoPath] = rawRegoData
	}
	return nil
}

// Load Loads all related rego files from the given policy path into memory
func (p *Policy) Load() error {
	// Walk the file path and find all directories
	dirList, err := utils.FindAllDirectories(p.path)
	if err != nil {
		return err
	}

	if len(dirList) == 0 {
		return fmt.Errorf("no directories found for path %s", p.path)
	}

	p.regoFileMap = make(map[string][]byte)
	p.ruleMap = make(map[string]*Rule)

	// Load rego data files from each dir
	// First, we read the metadata file, which contains info about the associated rego rule. The .rego file data is
	// stored in a map in its raw format.
	sort.Strings(dirList)
	for i := range dirList {
		// Find all files in the current dir
		var fileInfo []os.FileInfo
		fileInfo, err = ioutil.ReadDir(dirList[i])
		if err != nil {
			if !errors.Is(err, os.ErrNotExist) {
				zap.S().Debug("error while searching for files", zap.String("dir", dirList[i]))
			}
			continue
		}

		// Load the rego metadata first (*.json)
		metadataFiles := utils.FilterFileInfoBySuffix(&fileInfo, RegoMetadataFileSuffix)
		if metadataFiles == nil {
			zap.S().Debug("no metadata files were found", zap.String("dir", dirList[i]))
			continue
		}

		var regoDataList []*Rule
		for j := range *metadataFiles {
			filePath := filepath.Join(dirList[i], (*metadataFiles)[j])

			var regoMetadata *RegoMetadata
			regoMetadata, err = p.loadRegoMetadata(filePath)
			if err != nil {
				zap.S().Debug("error loading rego metadata", zap.String("file", filePath))
				continue
			}

			regoData := Rule{
				context:  p.context,
				Metadata: *regoMetadata,
			}

			regoDataList = append(regoDataList, &regoData)
			p.stats.metadataFileCount++
		}

		// Read in raw rego data from associated rego files
		if err = p.loadRawRegoFilesIntoMap(dirList[i], regoDataList, &p.regoFileMap); err != nil {
			zap.S().Debug("error loading raw rego data", zap.String("dir", dirList[i]))
			continue
		}

		for j := range regoDataList {
			p.stats.metadataCount++

			// Check if the template file exists
			templateFile := filepath.Join(dirList[i], regoDataList[j].Metadata.File)

			// Apply templates if available
			var templateData bytes.Buffer
			var t *template.Template
			t, err = template.New("opa").Option("missingkey=error").Parse(string(p.regoFileMap[templateFile]))
			if err != nil {
				zap.S().Debug("unable to parse template", zap.String("template", regoDataList[j].Metadata.File))
				continue
			}
			if err = t.Execute(&templateData, regoDataList[j].Metadata.TemplateArgs); err != nil {
				zap.S().Debug("unable to execute template", zap.String("template", regoDataList[j].Metadata.File))
				continue
			}

			regoDataList[j].RawRego = templateData.Bytes()
			p.ruleMap[regoDataList[j].Metadata.Name] = regoDataList[j]
		}
	}

	p.stats.ruleCount = len(p.ruleMap)
	p.stats.regoFileCount = len(p.regoFileMap)
	zap.S().Debugf("loaded %d Rego rules from %d rego files (%d metadata files).", p.stats.ruleCount, p.stats.regoFileCount, p.stats.metadataFileCount)

	return err
}

// Compile Compiles rego files for faster evaluation
func (p *Policy) Compile() error {
	//	ruleList := p.GetRules()
	for k := range p.ruleMap {
		rule := p.ruleMap[k]
		compiler, err := ast.CompileModules(map[string]string{
			rule.Metadata.Name: string(rule.RawRego),
		})
		if err != nil {
			zap.S().Error("error compiling rego files", zap.String("rule", rule.Metadata.Name),
				zap.String("raw rego", string(rule.RawRego)), zap.Error(err))
			return err
		}

		r := rego.New(
			rego.Query(RuleQueryBase+"."+rule.Metadata.Name),
			rego.Compiler(compiler),
		)

		// Create a prepared query that can be evaluated.
		query, err := r.PrepareForEval(p.context)
		if err != nil {
			zap.S().Error("error creating prepared query", zap.String("rule", rule.Metadata.Name),
				zap.String("raw rego", string(rule.RawRego)), zap.Error(err))
			return err
		}

		rule.PreparedQuery = &query
	}

	return nil
}
