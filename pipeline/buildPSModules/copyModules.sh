#!/bin/bash

set -e

echo "Unzipping modules"
mkdir BOSHmodulesExtracted
unzip -o BOSHmodules/* -d BOSHmodulesExtracted/

VERSION=$(cat clonedetail/version)
CLONEIP=$(cat clonedetail/ip-$VERSION.txt)
echo "Copying modules to clone at "$CLONEIP
sshpass -p $VMPASS scp -r -o StrictHostKeyChecking=no BOSHmodulesExtracted/* $VMUSER@$CLONEIP:'"/Program Files/WindowsPowerShell/Modules"'

echo "Modules copied to VM."
