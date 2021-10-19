#!/bin/bash
for i in $(ip a | grep "^[0-9]" | grep -v " lo:" | awk '{print $2}' | sed 's#:##g')
do
    ip address show dev ${i} | grep "inet " | awk '{print $2}'
done
