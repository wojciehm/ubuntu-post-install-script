#!/bin/bash

#Set history to 10000
set -o history   # Enable history expansion
HISTFILE=~/.bash_history  # Set the location of the history file
HISTSIZE=10000             # Increase history size (optional)

#Clear hostname
sudo truncate -s0 /etc/hostname
sudo hostnamectl set-hostname localhost

#Clear machine ID
sudo truncate -s0 /etc/machine-id
sudo rm /var/lib/dbus/machine-id
sudo ln -s /etc/machine-id /var/lib/dbus/machine-id

#Clean cloud-init
sudo cloud-init clean

# Delete old ssh host keys 
sudo /bin/rm -v /etc/ssh/ssh_host_*

#Regenerate OpenSSH Host Keys
sudo dpkg-reconfigure openssh-server

#Restart SSH
sudo systemctl restart ssh
