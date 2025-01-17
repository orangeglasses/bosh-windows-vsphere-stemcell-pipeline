#!/bin/bash

set -e

CLONEIP=$(cat redis-values/cloneip)
echo "Connecting to cell VM at "$CLONEIP

remote_cmd=(sshpass -p $VMPASS ssh -o StrictHostKeyChecking=no $VMUSER@$CLONEIP)

echo "Installing CF Features."
"${remote_cmd[@]}" 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{if (Get-Command -Name Install-CFFeatures -ErrorAction SilentlyContinue) { Install-CFFeatures } else { Install-CFFeatures2012 }}"'

echo "Protecting cell."
"${remote_cmd[@]}" 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{Protect-CFCell}"' 

echo "Installing agent."
"${remote_cmd[@]}" 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{Install-Agent -IaaS vsphere -agentZipPath \"C:\Program Files\WindowsPowerShell\Modules\agent.zip\"}"'

#echo "Enabling BOSH SSH."
#"${remote_cmd[@]}" 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{Install-SSHD -SSHZipFile \"C:\provision\OpenSSH-Win64.zip\"}"'

if [ "$SKIPOPT" == "0" ];
then
  echo "Optimize disk."
  if [ "$VERSION" == "1056.0" ];
  then
  echo "Using old Clear-Disk cmdlet."
  "${remote_cmd[@]}" 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{BOSH.Disk\Clear-Disk}"'
  else
  echo "Using new Optimize-Disk cmdlet."
  "${remote_cmd[@]}" 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{Optimize-Disk}"'
  fi

  echo "Defrag and zero out disk."
  "${remote_cmd[@]}" 'powershell -NonInteractive -ExecutionPolicy Unrestricted -Command "&{Compress-Disk}"'
fi

exit
