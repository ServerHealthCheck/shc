#!/bin/bash
echo $(( $(grep "MemFree" /proc/meminfo | cut -d':' -f2 | cut -d'k' -f1 | sed 's/ //g') / 1000))
