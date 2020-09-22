#!/bin/bash
cores=$(cat /sys/class/thermal/thermal_zone*/temp)

for i in $cores
	do core_new=$(($core_new+$i))
 	   counter=$(($counter+1))
	done

echo $(($core_new/$counter/1000))
