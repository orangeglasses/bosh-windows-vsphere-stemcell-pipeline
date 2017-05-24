#!/bin/bash

set -e

ls -lrt 
echo "Unzipping lgpo."
unzip lgpo.zip

CLONEIP=$(cat redis-values/cloneip)
echo "Connecting to cell VM at "$CLONEIP
remote_cmd=(sshpass -p $VMPASS ssh -o StrictHostKeyChecking=no $VMUSER@$CLONEIP)

echo "Copying lgpo.exe to Cell windows folder."
sshpass -p $VMPASS scp -r -o StrictHostKeyChecking=no LGPO.exe  $VMUSER@$CLONEIP:'"/Windows"'

echo "Invoke sysprep."
"${remote_cmd[@]}" 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{Invoke-Sysprep -IaaS vsphere -NewPassword "'$VMPASS'" -ProductKey "'$PRODUCTKEY'" -Owner "'$VMUSER'" -Organization "'$ORG'"}"'

exit
