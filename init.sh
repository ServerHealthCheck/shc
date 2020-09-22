#!/bin/bash
#author: junglert
#mail:
#date: 04.08.2020
#license: GPL-3.0
#summary: bash script that places the index.php and the scripts in the correct places

#variables
user="$USER"
site_name="index.php"
folder_name="shc_scripts"
home_path="/home/$USER"
final_path="$home_path/$folder_name"
index_path="/srv/www/htdocs"
index_path_debian="/var/www/html"
conffile="/etc/apache2/httpd.conf"
splitter="-------------------------------------------------"
package=$(grep ID_LIKE= /etc/os-release | cut -d'=' -f2 | head -1 | sed 's/"//g')
ip=$(ip a | grep inet | cut -d't' -f2 | grep 192 | cut -d' ' -f2 | cut -d'/' -f1)

#functions
installed_check(){ #check if apache and moudle are installed
echo "Checking if apache2 and apache2-mod_php7 are installed
"
case "$package" in
	"suse opensuse" | "opensuse suse")
		zypper se -i apache2 apache2-mod_php7 > /dev/null

		if [ $? -ne 0 ]
		then
			echo "Installing apache2 and php7 module"
			sudo zypper install -y apache2 apache2-mod_php7
			echo "Adding index.php to /etc/apache2/httpd.conf"
			sudo sed -in '/DirectoryIndex/s/$/ index.php/' $conffile
			echo "Starting apache2.service and php7 module"
			sudo systemctl enable --now apache2.service
			sudo a2enmod php7
			echo "
			"
		else
			echo "apache2 and php7 module are already installed"
			echo "Adding index.php to /etc/apache2/httpd.conf"
			sudo sed -in '/DirectoryIndex/s/$/ index.php/' $conffile
			echo "Starting apache2.service and php7 module"
			sudo systemctl enable --now apache2.service
			sudo a2enmod php7
			echo "
			"
		fi	
	;;

	"redhat" | "fedora" | "centos")
		sudo yum install -y apache2 apache2-mod_php7
	;;

	"arch")
		sudo pacman -S apache2 apache2-mod_php7
	;;

	"debian" | "ubuntu")
		sudo apt-get install -y apache2 libapache2-mod-php
		echo "Starting apache2.service and php7.4 module"
		sudo systemctl enable --now apache2.service
		sudo a2enmod php7.3
	;;

	*)
		echo "Cant find any suitable OS"
	;;
esac
}

folder_check(){ #generate folder for the scripts, if not already generated
echo "Initial check if folder $folder_name exists
"
if [ -d "$final_path" ];
	then
		echo "Folder exists
            	"
	else
        	echo "Creating $folder_name folder in /home/$user/
            	"
            	mkdir ${final_path}
fi
}

script_move(){ #move scripts into folder
echo "Moving scripts into $final_path
"
cd shc_scripts/
cp *.sh $final_path
cd ..
echo "Files moved successfully
"
}

index_move(){ #move index file into correct place
echo "Moving $site_name into apache2 default place (needs sudo)
"
case "$package" in
	"suse opensuse" | "opensuse suse")
		sudo cp $site_name $index_path/
		sudo chown $user:users $index_path/$site_name
		echo "Index file moved to $index_path/$site_name
		"
	;;

	"redhat" | "fedora" | "centos")
		sudo cp $site_name $index_path/
		sudo chown $user:users $index_path/$site_name
		echo "Index file moved to $index_path/$site_name
		"
	;;

	"arch")
		sudo cp $site_name $index_path/
		sudo chown $user:users $index_path/$site_name
		echo "Index file moved to $index_path/$site_name
		"
	;;

	"debian")
		if test -f $index_path_debian/index.html;
			then
				sudo mv $index_path_debian/index.html $index_path_debian/index.html.bkp
				echo "index.html renamed to index.html.bkp"
				sudo cp $site_name $index_path_debian/
				sudo chown $user:users $index_path_debian/$site_name
				echo "Index file moved to $index_path_debian/$site_name"
			else
				sudo cp $site_name $index_path_debian/
                                sudo chown $user:users $index_path_debian/$site_name
                                echo "Index file moved to $index_path_debian/$site_name"
		fi
	;;

	*)
		echo "Cant find any suitable OS"
	;;
esac
}

installed_check
echo $splitter
folder_check
echo $splitter
script_move
echo $splitter
index_move
echo $splitter
echo "Connect to $ip via your webbrowser
"
echo $splitter
