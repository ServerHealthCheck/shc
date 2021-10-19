#!/bin/bash
uptime | awk -F "up" '{print $2}' | cut -d, -f1 | sed 's/^ *//g'
