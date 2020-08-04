#!/bin/bash
df -h --output="size,used,pcent" / | cut -d' ' -f4 | tail -1 | cut -d'G' -f1
