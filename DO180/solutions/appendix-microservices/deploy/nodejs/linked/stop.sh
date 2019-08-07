#!/bin/bash

# if there was a problem with run.sh delete data dir so the database cab be re-initialized:
# rm -rf data

echo -n "• Deleting containers: "
docker stop todo_frontend &>/dev/null
docker stop todoapi &>/dev/null
docker stop mysql &>/dev/null
docker rm todo_frontend &>/dev/null
docker rm todoapi &>/dev/null
docker rm mysql &>/dev/null

echo "OK"


echo -n "• Deleting network: "
docker network rm do180-app-bridge &>/dev/null
echo "OK"
