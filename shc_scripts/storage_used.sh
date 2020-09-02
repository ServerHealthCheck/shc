#!/bin/bash
df -h --output="size,used,pcent" / | cut -d'U' -f4 | tail -1 | cut -d'G' -f2
