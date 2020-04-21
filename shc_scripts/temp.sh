#!/bin/bash
echo $(( $(cat /sys/class/thermal/thermal_zone6/temp) /1000))
