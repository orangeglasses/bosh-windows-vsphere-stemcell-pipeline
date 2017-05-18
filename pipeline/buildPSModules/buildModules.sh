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

echo "Building modules"
rake package:psmodules

echo "Copy to dedicated output"
cp build/bosh-psmodules.zip $MAINDIR/BOSHmodules/

echo Modules ready.
