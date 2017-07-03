#!/bin/bash

echo "Extracting VM as OVA."
ovftool --noSSLVerify --disableVerification --skipManifestGeneration vi://$VCUSER:$VCPASS@$VCHOST/dc/vm/WindowsStemClone ovadir/WindowsStemClone.ova
