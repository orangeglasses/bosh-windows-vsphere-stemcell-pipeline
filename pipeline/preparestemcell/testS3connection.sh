#!/bin/bash

set -e

MAINDIR=$PWD
echo "Current folder: "$MAINDIR

cd stemdir
echo "Creating file: bosh-stemcell-1001.3-vsphere-esxi-windows2012R2-go_agent.tgz"
touch bosh-stemcell-1001.3-vsphere-esxi-windows2012R2-go_agent.tgz

echo "File listing"
ls -lrt
