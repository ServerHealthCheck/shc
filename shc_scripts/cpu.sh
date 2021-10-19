#!/bin/bash
LANG=C.UTF-8 
lscpu | grep "Model name" | cut -d: -f2 | sed 's#^ *##'