#!/bin/bash

rm -rf src
cp -rp ../../apps/html5/src .

docker build -t do180/todo_frontend . 

