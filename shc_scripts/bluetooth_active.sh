#!/bin/bash
if test systemctl is-active bluetooth.service
then
	echo "active"
else
	echo "not active"
fi