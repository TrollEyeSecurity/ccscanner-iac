#!/bin/bash -e

sudo chown root:root /tmp/sudoers
sudo mv /tmp/sudoers /etc/sudoers
sudo mv /tmp/fury.list /etc/apt/sources.list.d/
sudo apt -qq update
sudo apt -qq install docker.io sysstat openvpn ccscanner -y
sudo rm -rf /home/ubuntu/.ssh/authorized_keys
sudo rm -rf /root/.ssh/authorized_keys
