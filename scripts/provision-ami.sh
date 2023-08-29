#!/bin/bash -e

sudo chown root:root /tmp/sudoers
sudo mv /tmp/sudoers /etc/sudoers
sudo mv /tmp/trolleyesecurity.list /etc/apt/sources.list.d/
sudo apt update && sudo apt dist-upgrade -y
sudo apt install open-vm-tools ccscanner -y
sudo rm -rf /home/ubuntu/.ssh/authorized_keys
sudo rm -rf /root/.ssh/authorized_keys
