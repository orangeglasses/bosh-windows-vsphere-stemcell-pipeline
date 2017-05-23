#!/bin/bash

set -e

echo "Current folder: "$PWD

echo clonedetail
ls clonedetail

CLONEIP=$(cat clonedetail/ip.txt)

echo "Unzipping modules"
mkdir BOSHmodulesExtracted
unzip -o BOSHmodules/* -d BOSHmodulesExtracted/

echo "Copying modules to clone at "$CLONEIP
sshpass -p $VMPASS scp -r -o StrictHostKeyChecking=no BOSHmodulesExtracted/* $VMUSER@$CLONEIP:'"/Program Files/WindowsPowerShell/Modules"'

echo "Modules copied to VM."
