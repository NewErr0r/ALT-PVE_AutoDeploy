#!/bin/bash

# Templates
ALT_SERVER=1001
JEOS=1002
ALT_WORKSTATION=1003
ECOROUTER=1004

## student1

# ISP
qm clone $JEOS 101 \
    --name "ISP" \
    --format qcow2 \
    --full \
    --pool "student1" \
    --storage "local"

qm set 101 \
    --net0 virtio,bridge=vmbr0 \
    --net1 virtio,bridge=vmbr101

# Eco-R
qm clone $ECOROUTER 102 \
    --name "Eco-R" \
    --format qcow2 \
    --full \
    --pool "student1" \
    --storage "local"

qm set 102 \
    --net0 virtio,bridge=vmbr0,link_down=1 \
    --net1 virtio,bridge=vmbr101 \
    --net2 virtio,bridge=vmbr102

# SRV
qm clone $ALT_SERVER 103 \
    --name "SRV" \
    --format qcow2 \
    --full \
    --pool "student1" \
    --storage "local"

qm set 103 \
    --net0 virtio,bridge=vmbr102

## student2

# ISP
qm clone $JEOS 201 \
    --name "ISP" \
    --format qcow2 \
    --full \
    --pool "student2" \
    --storage "local"

qm set 201 \
    --net0 virtio,bridge=vmbr0 \
    --net1 virtio,bridge=vmbr201

# Eco-R
qm clone $ECOROUTER 202 \
    --name "Eco-R" \
    --format qcow2 \
    --full \
    --pool "student2" \
    --storage "local"

qm set 202 \
    --net0 virtio,bridge=vmbr0,link_down=1 \
    --net1 virtio,bridge=vmbr201 \
    --net2 virtio,bridge=vmbr202

# SRV
qm clone $ALT_SERVER 203 \
    --name "SRV" \
    --format qcow2 \
    --full \
    --pool "student2" \
    --storage "local"

qm set 203 \
    --net0 virtio,bridge=vmbr202
