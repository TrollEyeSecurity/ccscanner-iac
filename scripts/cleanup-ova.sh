#!/usr/bin/env bash
echo "Modify the sudoers file"
sudo chown root:root /tmp/sudoers
sudo mv /tmp/sudoers /etc/sudoers

echo "Stop services for cleanup"
#Stop services for cleanup
sudo service rsyslog stop

echo "clear audit logs"
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

echo "cleanup persistent udev rules"
#cleanup persistent udev rules
if [[ -f /etc/udev/rules.d/70-persistent-net.rules ]]; then
    sudo rm /etc/udev/rules.d/70-persistent-net.rules
fi

echo "cleanup /tmp directories"
#cleanup /tmp directories
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

echo "cleanup current ssh keys"
#cleanup current ssh keys
sudo rm -f /etc/ssh/ssh_host_*

echo "regenerate on boot"
#regenerate on boot
sudo sh -c 'echo "#! /bin/bash" > /etc/rc.local'
sudo sh -c 'echo "test -f /etc/ssh/ssh_host_dsa_key || dpkg-reconfigure openssh-server" >> /etc/rc.local'
sudo sh -c 'echo "exit 0" >> /etc/rc.local'
sudo chmod +x /etc/rc.local

echo "reset hostname"
#reset hostname
sudo sh -c "cat /dev/null > /etc/hostname"

echo "cleanup apt"
#cleanup apt
sudo apt clean

echo "extend the drive"
sudo lvextend -l +100%FREE /dev/mapper/ubuntu--vg-ubuntu--lv
sudo resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv