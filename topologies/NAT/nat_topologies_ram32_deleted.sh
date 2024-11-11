#!/bin/bash

# Student1
qm destroy 101 --destroy-unreferenced-disks 1 --purge 1
qm destroy 102 --destroy-unreferenced-disks 1 --purge 1
qm destroy 103 --destroy-unreferenced-disks 1 --purge 1

# Student2
qm destroy 201 --destroy-unreferenced-disks 1 --purge 1
qm destroy 202 --destroy-unreferenced-disks 1 --purge 1
qm destroy 203 --destroy-unreferenced-disks 1 --purge 1