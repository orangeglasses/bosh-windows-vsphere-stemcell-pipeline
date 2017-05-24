#!/bin/bash

set -e

CLONEIP=$(cat redis-values/cloneip)
echo "Connecting to cell VM at "$CLONEIP

remote_cmd=(sshpass -p $VMPASS ssh -o StrictHostKeyChecking=no $VMUSER@$CLONEIP)
remote_ps_cmd=($remote_cmd 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command ')

echo "Installing CF Features."
#"${remote_cmd[@]}" 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{Install-CFFeatures}"'
"${remote_ps_cmd[@]}" '"&{Install-CFFeatures}"'

echo "Protecting cell".
#"${remote_cmd[@]}" 
exit
