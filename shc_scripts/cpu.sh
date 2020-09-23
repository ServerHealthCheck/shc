#!/bin/bash
lscpu | grep "Model name" | cut -d':' -f2
