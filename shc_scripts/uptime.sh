#!/bin/bash

# get uptime (removed extra foo)
uptime | awk -F "up" '{print $2}' | cut -d, -f1 | sed 's/^ *//g'