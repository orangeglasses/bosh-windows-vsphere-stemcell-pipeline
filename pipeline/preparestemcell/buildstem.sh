#!/bin/bash

set -e

MAINDIR=$PWD
echo "Current folder: "$MAINDIR

echo "Moving to resource folder: "$1
cd $1

echo "Checking out version "$VERSION
git checkout $VERSION

echo "Getting submodules"
git submodule update --init --recursive

echo "Bundling"
bundle install

echo "Building stemcell"
rake package:vsphere_ova[./ovadir/StemClone.ova,$MAINDIR/stemdir,$VERSION]

#echo "Move to dedicated output"
#mv build/bosh-psmodules.zip $MAINDIR/stemdir/

echo "Stemcell ready."
