#!/bin/bash
#author: junglert
#co-author: amueller
#mail:
#date: 18.12.2020
#license: GPL-3.0
#summary: These scripts installes required packages and moves files where they belong

# Output Configuration
TextColorRed='\033[0;31m'
TextColorOrange='\033[1;31m'
TextColorYellow='\033[1;33m'
TextColorGreen='\033[0;32m'
TextColorNone='\033[0m'
# These should be unchanged
distribution=$(grep ID_LIKE= /etc/os-release | cut -d'=' -f2 | head -1 | sed 's/"//g')
pkg_required="apache2 apache2-mod_php7"
ip=$(ip -o route get 0.0.0.1 | cut -d' ' -f7)
name_site="index.php"
shc_version="3.2.1"
# variables
path_folder_shc="$HOME/.shc"
path_file_index="/srv/www/htdocs"
path_file_conf="/etc/apache2/httpd.conf"
active_scripts="storage_used storage_total temperature mem_used mem_total ip hostname os kernel_version uptime cpu arch"

#functions
splitter(){
	echo "-------------------------------------------------"
}
1install_packages(){
echo -e "${TextColorYellow}[NOTE   ]${TextColorNone}\tChecking if apache2 and apache2-mod_php7 are installed"
case "${distribution}" in
	"suse opensuse" | "opensuse suse")
		for package in ${pkg_required}
		do
			zypper se -i $package &> /dev/null
			pkg_installed=$((${pkg_installed} + $?))
		done
		if [ ${pkg_installed} -ne 0 ]
		then
			echo -e "${TextColorYellow}[INSTALL]${TextColorNone}\tInstalling required packages"
			sudo zypper install -y ${pkg_required} &> /dev/null
		else
			echo -e "${TextColorGreen}[NOTE   ]${TextColorNone}\tRequired packages are alread installed"
		fi	
		echo -e "${TextColorYellow}[CONFIG ]${TextColorNone}\tAdding index.php to /etc/apache2/httpd.conf"
		sudo sed -in '/DirectoryIndex/s/$/ index.php/' ${path_file_conf}
		if ! sudo a2enmod -l | grep -q php7
		then
			echo -e "${TextColorYellow}[CONFIG ]${TextColorNone}\tEnabling php module"
			sudo a2enmod php7
		else
			echo -e "${TextColorGreen}[NOTE   ]${TextColorNone}\tPhp module already active"
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
		sudo a2enmod php7.3
	;;

	*)
		echo -e "${TextColorRed}[ERROR  ]${TextColorNone}\tCant find any suitable OS"
		exit
	;;
esac
if ! groups ${USER} | grep -q "www"
then
	echo -e "${TextColorYellow}[CONFIG ]${TextColorNone}\tAdding $USER to group www"
	sudo usermod -aG www ${USER}
else
	echo -e "${TextColorGreen}[CONFIG ]${TextColorNone}\t$USER is already part of group www"
fi
if systemctl list-unit-files | grep -e "apache2.service" | grep -qe  "enabled"
then
	echo -e "${TextColorGreen}[NOTE   ]${TextColorNone}\tWebserver already enabled"
else
	echo -e "${TextColorYellow}[CONFIG ]${TextColorNone}\tEnabling webserver"
	sudo systemctl enable --now apache2.service &> /dev/null
fi
}

2create_folder(){
if [ -d "${path_folder_shc}" ];
	then
		echo -e "${TextColorGreen}[NOTE   ]${TextColorNone}\t${path_folder_shc} already exists"
	else
		echo -e "${TextColorYellow}[NOTE   ]${TextColorNone}\tCreating ${path_folder_shc}"
        mkdir ${path_folder_shc}
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
				echo "Index file moved to $index_path_debian/$site_name
				"
			else
				sudo cp $site_name $index_path_debian/
                                sudo chown $user:users $index_path_debian/$site_name
                                echo "Index file moved to $index_path_debian/$site_name
				"
		fi
	;;

	*)
		echo "Cant find any suitable OS
		"
		exit
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
