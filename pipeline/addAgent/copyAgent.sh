#!/bin/bash

set -e

CLONEIP=$(cat redis-values/cloneip)
echo "Copying agent to clone at "$CLONEIP
if [[ $CLONEIP == *":"* ]]; then
  sshpass -p $VMPASS scp -r -o StrictHostKeyChecking=no BOSHagent/* $VMUSER@\[$CLONEIP\]:'"/Program Files/WindowsPowerShell/Modules"'
else
  sshpass -p $VMPASS scp -r -o StrictHostKeyChecking=no BOSHagent/* $VMUSER@$CLONEIP:'"/Program Files/WindowsPowerShell/Modules"'
fi

echo "Agent zip copied to VM."
