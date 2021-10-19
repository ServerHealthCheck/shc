#!/bin/bash
df --human-readable --output="size" '/' | xargs | awk '{print $2}'
