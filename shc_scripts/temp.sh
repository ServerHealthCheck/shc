#!/bin/bash
echo $(( $(cat /sys/class/thermal/thermal_zone*/temp) /1000))
