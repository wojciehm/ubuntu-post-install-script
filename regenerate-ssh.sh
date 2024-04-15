#!/bin/bash

set -o history   # Enable history expansion
HISTFILE=~/.bash_history  # Set the location of the history file
HISTSIZE=10000             # Increase history size (optional)

#Clear hostname
truncate -s0 /etc/hostname
hostnamectl set-hostname localhost

#Clear machine ID
truncate -s0 /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

#Clean cloud-init
sudo cloud-init clean
