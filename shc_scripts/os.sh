#!/bin/bash
OS= cat /etc/os-release | grep NAME= | cut -d'"' -f2 | head -1
echo $OS
