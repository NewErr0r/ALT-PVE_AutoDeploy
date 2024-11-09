#!/bin/bash

ALT_SERVER=1001
JEOS=1002
ALT_WORKSTATION=1003
ECOROUTER=1004

qm clone 1001 101 \
    --name "ISP" \
    --format qcow2 \
    --full \
    --pool "test_pool" \
    --storage "local"

qm set 101 \
    --net0 virtio,bridge=vmbr101 #\
#    --net1 virtio,bridge=vmbr102