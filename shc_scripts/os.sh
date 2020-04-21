#!/bin/bash
cat /etc/os-release | grep PRETTY_NAME= | cut -d'"' -f2 | head -1
