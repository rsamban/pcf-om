#!/bin/bash

# if there was a problem with run.sh delete data dir so the database cab be re-initialized:
# rm -rf data

sudo podman stop todoui
sudo podman stop todoapi
sudo podman stop mysql
sudo podman rm todoui
sudo podman rm todoapi
sudo podman rm mysql
sudo podman network rm do180-app-bridge