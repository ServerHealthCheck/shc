#!/bin/bash
echo $(df -hT | grep sda3 | cut -d'G' -f2)
