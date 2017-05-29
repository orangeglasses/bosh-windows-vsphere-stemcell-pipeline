#!/bin/bash

echo "Extracting VM as OVA."
ovftool --noSSLVerify vi://$VCUSER:$VCPASS@$VCHOST/dc/vm/WindowsStemClone ovadir/WindowsStemClone.ova
