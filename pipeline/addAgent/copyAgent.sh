#!/bin/bash

set -e

CLONEIP=$(cat redis-values/cloneip)
echo "Copying agent to clone at "$CLONEIP
sshpass -p $VMPASS scp -r -o StrictHostKeyChecking=no BOSHagent/* $VMUSER@$CLONEIP:'"/temp"'

echo "Agent zip copied to VM."
