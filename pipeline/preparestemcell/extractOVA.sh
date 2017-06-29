#!/bin/bash

echo "Extracting VM as OVA."
ovftool --noSSLVerify --shaAlgorithm=sha1 vi://$VCUSER:$VCPASS@$VCHOST/dc/vm/WindowsStemClone ovadir/WindowsStemClone.ova
