#!/bin/bash
cat /etc/os-release | grep NAME= | cut -d'"' -f2 | head -1
