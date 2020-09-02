#!/bin/bash
df -h --output="size,used,pcent" / | cut -d'S' -f2 | tail -1 | cut -d'G' -f1
