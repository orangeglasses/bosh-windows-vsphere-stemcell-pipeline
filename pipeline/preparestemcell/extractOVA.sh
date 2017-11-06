#!/bin/bash

echo "Extracting VM as OVA."
ovftool --noSSLVerify --disableVerification --skipManifestGeneration vi://$VCUSER:$VCPASS@$VCHOST/$VCDC/vm$VCVMFOLDER/WindowsStemClone ovadir/WindowsStemClone.ova
