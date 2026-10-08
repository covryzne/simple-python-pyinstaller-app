#!/usr/bin/env sh

echo 'The following PyInstaller command bundles your Python application'
echo 'into a standalone executable inside the "dist" directory.'
set -x
pyinstaller --onefile sources/add2vals.py
set +x

echo 'The following command runs your application in the background'
echo 'and writes its process ID (PID) to ".pidfile".'
set -x
./dist/add2vals &
sleep 1
echo $! > .pidfile
set +x

echo 'Now your Python application executable is built and verified.'