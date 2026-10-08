#!/usr/bin/env sh

echo 'The following command runs pytest to test your Python application'
echo 'and generates a JUnit XML report for Jenkins.'
set -x
py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py
set +x