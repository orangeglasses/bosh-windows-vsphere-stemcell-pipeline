#!/bin/bash

set -e

CLONEIP=$(cat redis-values/cloneip)
echo "Connecting to cell VM at "$CLONEIP

REMOTEEXEC=(sshpass -p $VMPASS ssh -o StrictHostKeyChecking=no $VMUSER@$CLONEIP)

echo "Installing CF Features."
# powershell -NonInteractive -ExecutionPolicy Unrestricted -File Install-CFFeatures
#$REMOTEEXEC 'powershell -NonInteractive -ExecutionPolicy Unrestricted -File Install-CFFeatures'
# sshpass -p $VMPASS ssh -o StrictHostKeyChecking=no $VMUSER@$CLONEIP 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{Install-CFFeatures}"'
#@{REMOTEEXEC} 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{Install-CFFeatures}"'
"${REMOTEEXEC[@]}" 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{Install-CFFeatures}"'

exit
