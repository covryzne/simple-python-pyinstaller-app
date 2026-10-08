#!/usr/bin/env sh

echo 'Bundling Python application into a standalone executable...'
set -x
pyinstaller --onefile sources/add2vals.py
set +x

echo 'Running the executable and writing PID to .pidfile...'
set -x
./dist/add2vals &
sleep 1
echo $! > .pidfile
set +x