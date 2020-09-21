#!/bin/bash

# get the distro flavour
OS_flavour=$(grep "ID_LIKE" /etc/os-release | cut -d'=' -f2 | sed 's/"//g')