#!/bin/bash
SERVICE=sshd
systemctl status $SERVICE > /dev/null
if [ $? -ne 0 ]
then
	echo "not active"
else
	echo "active"
fi
