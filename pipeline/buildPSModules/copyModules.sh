#!/bin/bash

set -e

echo "Unzipping modules"
mkdir BOSHmodulesExtracted
unzip -o BOSHmodules/* -d BOSHmodulesExtracted/

ls -lrt

CLONEIP=$(cat cloneip)
echo "Copying modules to clone at "$CLONEIP
sshpass -p $VMPASS scp -r -o StrictHostKeyChecking=no BOSHmodulesExtracted/* $VMUSER@$CLONEIP:'"/Program Files/WindowsPowerShell/Modules"'

echo "Modules copied to VM."
