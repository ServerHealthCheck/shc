#!/bin/bash
#!/bin/bash
if test systemctl is-active sshd.service
then
	echo "active"
else
	echo "not active"
fi
