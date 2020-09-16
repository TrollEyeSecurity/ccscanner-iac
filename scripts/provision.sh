#!/bin/bash -e

sudo mv /tmp/fury.list /etc/apt/sources.list.d/
sudo apt update
sudo apt install docker.io sysstat ccscanner -y
sudo rm -rf /home/ubuntu/.ssh/authorized_keys
sudo rm -rf /root/.ssh/authorized_keys