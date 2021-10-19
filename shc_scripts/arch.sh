#!/bin/bash
LANG=C.UTF-8 
lscpu | grep "Architecture" | cut -d: -f2 | sed 's#^ *##'