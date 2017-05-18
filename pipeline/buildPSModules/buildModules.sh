#!/bin/bash

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

echo Modules ready.
exit 0
