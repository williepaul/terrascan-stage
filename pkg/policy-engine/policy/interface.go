package policy

import "github.com/accurics/terrascan/pkg/policy-engine/rule"

// Policy ...
type Policy interface {
	Init(string) error
	Load() error
	Compile() error
	GetRules() ([]rule.Rule, error)
}
