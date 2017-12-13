#!/bin/bash

set -e

MAINDIR=$PWD
echo "Current folder: "$MAINDIR

echo "Making sure stembuild is on path"
cd stembuild
chmod +x stembuild
cp stembuild /usr/bin/stembuild

echo "Moving to resource folder: "$1
cd $1

echo "Checking out version "$VERSION
git checkout tags/$VERSION

echo "Getting submodules"
git submodule update --init --recursive -f

echo "Bundling"
bundle install

echo "Building stemcell"
rake package:vsphere_ova[$MAINDIR/ovadir/WindowsStemClone.ova,$MAINDIR/stemdir,$VERSION]

echo "Stemcell ready."
