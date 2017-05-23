#!/bin/bash

set -e

echo "Connecting to cell VM."
# todo add ip returned from vro script
sshpass -p $VMPASS ssh -o StrictHostKeyChecking=no $VMUSER@192.168.0.80

echo "Installing CF Features."
powershell -NonInteractive -ExecutionPolicy Unrestricted -File Install-CFFeatures

echo "Disconnect."
exit
