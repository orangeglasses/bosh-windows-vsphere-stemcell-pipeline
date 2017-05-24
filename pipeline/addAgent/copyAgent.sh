#!/bin/bash

set -e

CLONEIP=$(cat cloneip/cloneip)
echo "Copying agent to clone at "$CLONEIP
sshpass -p $VMPASS scp -r -o StrictHostKeyChecking=no BOSHagent/* $VMUSER@$CLONEIP:'"/Program Files/WindowsPowerShell/Modules"'

echo "Agent zip copied to VM."
