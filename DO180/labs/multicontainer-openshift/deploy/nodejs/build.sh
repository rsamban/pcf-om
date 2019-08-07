#!/bin/bash

rm -fr build
mkdir -p build
cp -ap nodejs-source/* build
rm build/*.sh
cp -p db.js build/models
chmod -R a+rwX build


sudo podman build -t do180/todonodejs .
