#!/bin/bash
df --human-readable --output="used" '/' | xargs | awk '{print $2}'
