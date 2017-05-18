#!/bin/bash

echo $VERSION
echo $PWD

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
