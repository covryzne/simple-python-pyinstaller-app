#!/usr/bin/env sh

echo 'Running unit tests using pytest...'
set -x
python3 -m pytest --verbose --junit-xml test-reports/results.xml sources/test_calc.py
set +x