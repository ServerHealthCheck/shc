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
home_path="$HOME"
final_path="$home_path/$folder_name"
index_path="/srv/www/htdocs"
index_path_debian="/var/www/html"
splitter="-------------------------------------------------"
package=$(grep ID_LIKE= /etc/os-release | cut -d'=' -f2 | head -1 | sed 's/"//g')
ip=$(ip a | grep inet | cut -d't' -f2 | grep 192 | cut -d' ' -f2 | cut -d'/' -f1)


#functions
root_check(){ #check if logged in as user root
if [ $USER == "root" ]
	then
		echo "Change to another user, dont use root
		"
		sleep 10
		exit
fi
}

installed_check(){ #check if apache and moudle are installed
echo "Checking if apache2 and apache2-mod_php7 are installed
"
case "$package" in
	"suse opensuse" | "opensuse suse")
		zypper se -i apache2 apache2-mod_php7 > /dev/null

		if [ $? -ne 0 ]
		then
			echo "installing apache2 and php7 module"
			sudo zypper install -y apache2 apache2-mod_php7
		else
			echo "apache2 and php7 module are already installed
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
				sudo rm $index_path_debian/index.html
				echo "index.html deleted"
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

module_activation(){ #activate php module
echo "Starting apache2.service and php7 module
"
sudo systemctl enable --now apache2.service
sudo a2enmod php7.4
echo " "
}

splitter(){
echo $splitter
}

root_check
splitter
installed_check
splitter
module_activation
splitter
folder_check
splitter
script_move
splitter
index_move
splitter
echo "Connect to $ip via your webbrowser
"
splitter
