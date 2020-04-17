#!/bin/bash
#SPACE= lsblk | grep sda | cut -d'G' -f 1 | cut -d'a' -f 2 | cut -d'0' -f 3
SPACE2= df -h --total | cut -d'l' -f 2 | cut -d's' -f 10 | cut -d'i' -f 5 | cut -d't' -f 2 | cut -d'G' -f 1 
echo $SPACE2 
