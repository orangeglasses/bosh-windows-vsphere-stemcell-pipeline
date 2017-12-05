#!/bin/bash

set -e

MAINDIR=$PWD
echo "Current folder: "$MAINDIR

echo "Moving to resource folder: "$1
cd $1

echo "Checking out version "$VERSION
git checkout tags/$VERSION

echo "Getting submodules"
git submodule update --init --recursive -f

echo "Bundling"
bundle install

echo "Building agent"
rake package:agent

echo "Copy to dedicated output"
cp build/agent.zip $MAINDIR/BOSHagent/

echo "Modules ready."
