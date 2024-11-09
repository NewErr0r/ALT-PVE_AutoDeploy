#!/bin/bash

# Create Bridges
for number in {101..110}; do
    mkdir /etc/net/ifaces/vmbr$number;
    echo -e \
"BOOTPROTO=static
CONFIG_IPV4=yes
HOST=
ONBOOT=yes
TYPE=bri" \
    | tee -a /etc/net/ifaces/vmbr$number/options
    echo -e \
"auto vmbr$number
iface vmbr$number inet manual
	bridge-ports none
	bridge-stp off
	bridge-fd 0
" \
    | tee -a /etc/network/interfaces
done

for number in {201..210}; do
    mkdir /etc/net/ifaces/vmbr$number;
    echo -e \
"BOOTPROTO=static
CONFIG_IPV4=yes
HOST=
ONBOOT=yes
TYPE=bri" \
    | tee -a /etc/net/ifaces/vmbr$number/options
    echo -e \
"auto vmbr$number
iface vmbr$number inet manual
	bridge-ports none
	bridge-stp off
	bridge-fd 0
" \
    | tee -a /etc/network/interfaces
done

systemctl restart network