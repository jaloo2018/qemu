#!/bin/bash
# README
./configure -q
make -s
sudo make install -s

# dhcp.SlackBuild
# Install the dhclient-script for linux
cat client/scripts/linux > $PKG/sbin/dhclient-script
chmod 700 $PKG/sbin/dhclient-script
