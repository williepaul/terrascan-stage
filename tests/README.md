# Policy Tests

We use [bats](https://github.com/bats-core/bats-core) for validating that rego policies are triggering issues on scans. The [test_templates](test_templates/) directory contains IaC template files with issues. The [rego_tests.bats](rego_tests.bats) file contains the test.
