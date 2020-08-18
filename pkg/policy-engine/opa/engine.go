/*
    Copyright (C) 2020 Accurics, Inc.

	Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

		http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

package opa

import (
	"fmt"
	"time"

	policyengine "github.com/accurics/terrascan/pkg/policy-engine"

	"github.com/accurics/terrascan/pkg/results"
	"go.uber.org/zap"
)

var (
	errInitFailed = fmt.Errorf("failed to initialize policy engine")
)

// NewEngine returns a new policy engine
func NewEngine(policyPath string) (*Engine, error) {

	engine := &Engine{}

	// initialize the engine
	if err := engine.Init(policyPath); err != nil {
		zap.S().Error("failed to initialize policy engine")
		return engine, errInitFailed
	}

	// successful
	return engine, nil
}

// Init initializes the policy engine
// Handles loading all rules, filtering, compiling, and preparing for evaluation
func (e *Engine) Init(policyPath string) error {
	// initialize ViolationStore
	e.results.ViolationStore = results.NewViolationStore()

	var err error
	e.policy, err = NewPolicy()
	if err != nil {
		return err
	}

	return e.policy.Init(policyPath)
}

// Configure Configures the policy engine
func (e *Engine) Configure() error {

	if err := e.policy.Load(); err != nil {
		zap.S().Error("error loading policy files", zap.Error(err))
		return err
	}

	err := e.policy.Compile()
	if err != nil {
		zap.S().Error("error compiling policy files", zap.Error(err))
		return err
	}

	return nil
}

// GetResults Fetches results from the engine policy evaluation
func (e *Engine) GetResults() policyengine.EngineOutput {
	return e.results
}

// Release Performs any tasks required to free resources
func (e *Engine) Release() error {
	return nil
}

// Evaluate Executes compiled queries against the input JSON data
func (e *Engine) Evaluate(engineInput policyengine.EngineInput) (policyengine.EngineOutput, error) {
	// Keep track of how long it takes to evaluate the policies
	start := time.Now()

	// Evaluate the policy against each resource type
	for _, r := range e.policy.GetRules() {

		// Execute the prepared query.
		violations, err := r.Evaluate(engineInput.InputData)
		if err != nil {
			zap.S().Warn("error encountered while evaluating rule", zap.Error(err))
			continue
		}

		if len(violations) > 0 {
			e.results.ViolationStore.Violations = append(e.results.ViolationStore.Violations, violations...)
			for i := range violations {
				switch violations[i].Severity {
				case "HIGH":
					e.results.ViolationStore.Count.HighCount++
				case "MEDIUM":
					e.results.ViolationStore.Count.MediumCount++
				case "LOW":
					e.results.ViolationStore.Count.LowCount++
				default:
					zap.S().Debug("invalid severity in policy", zap.String("severity", violations[i].Severity), zap.String("rule name", violations[i].RuleName))
				}
				e.results.ViolationStore.Count.TotalCount++
			}
		}

	}

	e.stats.runTime = time.Since(start)
	return e.results, nil
}
