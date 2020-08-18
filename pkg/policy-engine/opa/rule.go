package opa

import (
	"context"

	"github.com/accurics/terrascan/pkg/iac-providers/output"
	"github.com/accurics/terrascan/pkg/results"
	"github.com/accurics/terrascan/pkg/utils"
	"github.com/open-policy-agent/opa/rego"
	"go.uber.org/zap"
)

// reportViolation Add a violation for a given resource
func (r *Rule) createViolation(resource *output.ResourceConfig) *results.Violation {
	violation := &results.Violation{
		RuleName:     r.Metadata.Name,
		Description:  r.Metadata.Description,
		RuleID:       r.Metadata.ReferenceID,
		Severity:     r.Metadata.Severity,
		Category:     r.Metadata.Category,
		RuleFile:     r.Metadata.File,
		RuleData:     r.RawRego,
		ResourceName: resource.Name,
		ResourceType: resource.Type,
		ResourceData: resource.Config,
		File:         resource.Source,
		LineNumber:   resource.Line,
	}

	return violation
}

func (r *Rule) Evaluate(inputData *output.AllResourceConfigs) ([]*results.Violation, error) {
	rs, err := r.PreparedQuery.Eval(context.Background(), rego.EvalInput(inputData))
	if err != nil {
		zap.S().Warn("failed to run prepared query", zap.String("rule", "'"+string(r.RawRego)+"'"))
		return nil, err
	}

	if len(rs) == 0 || len(rs[0].Expressions) == 0 {
		return nil, err
	}

	resourceViolations := rs[0].Expressions[0].Value.([]interface{})
	if len(resourceViolations) == 0 {
		return nil, err
	}

	// Report a violation for each resource returned by the policy evaluation
	violationList := make([]*results.Violation, 0)
	for i := range resourceViolations {
		var resourceID string

		// The return values come in two categories--either a map[string]interface{} type, where the "Id" key
		// contains the resource ID, or a string type which is the resource ID. This resource ID is where a
		// violation was found
		switch res := resourceViolations[i].(type) {
		case map[string]interface{}:
			_, ok := res["Id"]
			if !ok {
				zap.S().Warn("no Id key found in resource map", zap.Any("resource", res))
				return nil, err
			}

			_, ok = res["Id"].(string)
			if !ok {
				zap.S().Warn("id key was invalid", zap.Any("resource", res))
				return nil, err
			}
			resourceID = res["Id"].(string)
		case string:
			resourceID = res
		default:
			zap.S().Warn("resource ID format was invalid", zap.Any("resource", res))
			return nil, err
		}

		// Locate the resource details within the input map
		var resource *output.ResourceConfig
		resource, err = utils.FindResourceByID(resourceID, inputData)
		if err != nil {
			zap.S().Error(err)
			return nil, err
		}
		if resource == nil {
			zap.S().Warn("resource was not found", zap.String("resource id", resourceID))
			return nil, err
		}

		violationList = append(violationList, r.createViolation(resource))
	}

	return violationList, nil
}
