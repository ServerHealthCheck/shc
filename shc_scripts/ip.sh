#!/bin/bash
ip a | grep inet | cut -d't' -f2 | grep 192 | cut -d' ' -f2
