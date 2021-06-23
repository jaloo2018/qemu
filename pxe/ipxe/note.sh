#!/bin/bash
# Quick Start
# URL: https://ipxe.org
ifstat
dhcp
route
show dns
chain http://boot.ipxe.org/demo/boot.php

# dhcp
ifconf -c dhcp net0
# static
ifopen net0
set net0/ip 192.168.0.199
set net0/netmask 255.255.255.0

