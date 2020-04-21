#!/bin/bash
systemctl status sshd > /dev/null
if [ $? -ne 0 ]
then
	echo "not active"
else
	echo "active"
fi
