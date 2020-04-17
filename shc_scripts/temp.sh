#!/bin/bash
CPU=$(cat /sys/class/thermal/thermal_zone6/temp)
TEMP=$(($CPU/1000))
echo $TEMP
