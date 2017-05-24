#!/bin/bash

set -e

CLONEIP=$(cat redis-values/cloneip)
echo "Connecting to cell VM at "$CLONEIP

sshpass -p $VMPASS ssh -o StrictHostKeyChecking=no $VMUSER@$CLONEIP

echo "Installing CF Features."
powershell -NonInteractive -ExecutionPolicy Unrestricted -File Install-CFFeatures

echo "Disconnect."
exit
