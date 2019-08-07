#!/bin/bash

rm -fr build
mkdir -p build
cp -ap ../../apps/nodejs_api/* build
rm build/*.sh
chmod -R a+rwX build

# base image ONBUILD does npm install

# podman build complains if he cannot read the database folder even if not needed for building the image
sudo rm -rf {linked,kubernetes}/work

sudo podman build -t do180/todoapi_nodejs .
