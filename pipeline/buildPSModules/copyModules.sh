#!/bin/bash

set -e

echo "Current folder: "$PWD

echo "Copying modules"
# todo add ip returned from vro script
sshpass -p \"$VMPASS\" scp BOSHmodules/* $VMUSER@192.168.0.80:'"/Program Files/WindowsPowerShell/Modules"'

echo Modules copied to VM.
