#!/bin/bash

# Create VM for template alt-server-10.2-x86-64
qm create 1001 --tags "alt-server-10.2" \
    --name "alt-server-10.2-x86-64" \
    --sockets 1 \
    --cores 2 \
    --memory 2048 \
    --ostype l26 \
    --scsihw virtio-scsi-single  \
    --net0 virtio,bridge=vmbr0
qm disk import 1001 /home/student/PVE_Images/Alt-Server-10.2-x86-64.qcow2 local --format qcow2
qm set 1001 --scsi0 local:1001/vm-1001-disk-0.qcow2 \
    --boot order=scsi0
qm template 1001

# Create VM for template alt-p11-jeos-systemd-x86-64
qm create 1002 --tags "alt-p11-jeos" \
    --name "alt-p11-jeos-systemd-x86-64" \
    --sockets 1 \
    --cores 1 \
    --memory 1024 \
    --ostype l26 \
    --scsihw virtio-scsi-single  \
    --net0 virtio,bridge=vmbr0
qm disk import 1002 /home/student/PVE_Images/alt-p11-jeos-systemd-x86-64.qcow2 local --format qcow2
qm set 1002 --scsi0 local:1002/vm-1002-disk-0.qcow2 \
    --boot order=scsi0
qm template 1002

# Create VM for template alt-workstation-10.2-x86-64
qm create 1003 --tags "alt-workstation-10.2" \
    --name "alt-workstation-10.2-x86-64" \
    --sockets 1 \
    --cores 2 \
    --memory 2048 \
    --ostype l26 \
    --scsihw virtio-scsi-single  \
    --net0 virtio,bridge=vmbr0
qm disk import 1003 /home/student/PVE_Images/alt-workstation-10.2-x86-64.qcow2 local --format qcow2
qm set 1003 --scsi0 local:1003/vm-1003-disk-0.qcow2 \
    --boot order=scsi0
qm template 1003

# Create VM for template EcoRouter
qm create 1004 --tags "EcoRouter" \
    --name "ecorouter" \
    --serial0 socket \
    --vga serial0 \
    --machine q35 \
    --bios seabios \
    --sockets 1 \
    --cores 2 \
    --cpu host \
    --memory 4096 \
    --ostype l26 \
    --net0 vmxnet3,bridge="vmbr0" \
    --net1 vmxnet3,bridge="vmbr0"

qm disk import 1004 /home/student/PVE_Images/EcoRouter.qcow2 local --format qcow2
qm set 1004 --ide0 local:1004/vm-1004-disk-0.qcow2 \
    --boot order=ide0
qm template 1004