#!/bin/bash

# if there was a problem with run.sh delete data dir so the database cab be re-initialized:
# rm -rf data

docker stop todoui
docker stop todoapi
docker stop mysql
docker rm todoui
docker rm todoapi
docker rm mysql
docker network rm do180-app-bridge