#!/bin/bash

rm -fr build
mkdir -p build
cp -ap nodejs-source/* build
rm build/*.sh
cp -p db.js build/models
chmod -R a+rwX build

# base image ONBUILD does npm install

# docker build complains if he cannot read the database folder even if not needed for building the image
sudo rm -rf {linked,kubernetes}/work

docker build -t do180/todonodejs .
