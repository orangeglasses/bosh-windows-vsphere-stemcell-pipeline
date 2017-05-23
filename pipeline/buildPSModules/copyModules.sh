#!/bin/bash

set -e

echo "Current folder: "$PWD

echo "Unzipping modules"
mkdir BOSHmodulesExtracted
unzip -o BOSHmodules/* -d BOSHmodulesExtracted/

echo "Copying modules"
# todo add ip returned from vro script
sshpass -p $VMPASS scp -r -o StrictHostKeyChecking=no BOSHmodulesExtracted/* $VMUSER@192.168.0.80:'"/Program Files/WindowsPowerShell/Modules"'

echo "Modules copied to VM."
