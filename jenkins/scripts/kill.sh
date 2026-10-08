#!/usr/bin/env sh

echo 'The following command terminates the Python application process using its PID'
echo '(written to ".pidfile"), which was executed in "deliver.sh".'
set -x
kill $(cat .pidfile)
set +x