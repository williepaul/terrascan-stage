package rule

import (
	"github.com/accurics/terrascan/pkg/iac-providers/output"
	"github.com/accurics/terrascan/pkg/results"
)

type Rule interface {
	Evaluate(*output.AllResourceConfigs) ([]*results.Violation, error)
}
