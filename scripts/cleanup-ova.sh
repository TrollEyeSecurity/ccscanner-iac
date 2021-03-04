#!/usr/bin/env bash
sudo chown root:root /tmp/sudoers
sudo mv /tmp/sudoers /etc/sudoers

#Stop services for cleanup
sudo service rsyslog stop

#clear audit logs
if [[ -f /var/log/audit/audit.log ]]; then
    sudo sh -c "cat /dev/null > /var/log/audit/audit.log"
fi
if [[ -f /var/log/wtmp ]]; then
    sudo sh -c "cat /dev/null > /var/log/wtmp"
fi
if [[ -f /var/log/lastlog ]]; then
    sudo sh -c "cat /dev/null > /var/log/lastlog"
fi

#cleanup persistent udev rules
if [[ -f /etc/udev/rules.d/70-persistent-net.rules ]]; then
    sudo rm /etc/udev/rules.d/70-persistent-net.rules
fi

#cleanup /tmp directories
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

#cleanup current ssh keys
sudo rm -f /etc/ssh/ssh_host_*

#regenerate on boot
sudo sh -c 'echo "#! /bin/bash" > /etc/rc.local'
sudo sh -c 'echo "test -f /etc/ssh/ssh_host_dsa_key || dpkg-reconfigure openssh-server" >> /etc/rc.local'
sudo sh -c 'echo "exit 0" >> /etc/rc.local'
sudo chmod +x /etc/rc.local

#reset hostname
sudo sh -c "cat /dev/null > /etc/hostname"

#cleanup apt
sudo apt clean
