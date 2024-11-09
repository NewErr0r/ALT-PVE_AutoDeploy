#!/bin/bash

pveum pool add student1 --comment "student1"
pveum pool add student2 --comment "student2"

pveum user add student1@pve --comment "student1" --password "P@ssw0rd"
pveum user add student2@pve --comment "student2" --password "P@ssw0rd"

pveum acl modify /pool/student1 --user student1@pve --role PVEVMAdmin
pveum acl modify /pool/student2 --user student2@pve --role PVEVMAdmin