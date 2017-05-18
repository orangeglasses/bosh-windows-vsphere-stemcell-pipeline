#!/bin/bash

echo $VERSION
echo $1

echo "Moving to resource folder"
cd $1

echo "Checking out version "$VERSION
git checkout $VERSION

echo "Getting submodules"
git submodule update --init --recursive

echo "Installing bundler"
gem install bundler

echo "Bundling"
bundle install

echo "Building modules"
rake package:psmodules

echo Modules ready.
exit 0
