#!/bin/bash

set -e

echo "Moving to resource folder"
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
cp build/bosh-psmodules.zip BOSHmodules/

echo Modules ready.
