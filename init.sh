#!/bin/bash
#author: junglert
#mail:
#date: 15.04.2020
#license: GPL-3.0
#summary: bash script that places the index.php and the scripts in the correct places

#variables
user="$USER"
site_name="index.php"
folder_name="shc_scripts"
folder_path="/home/$user/$script_name"
splitter="----------------------------------------------------------------"

#functions

#generate folder for the scripts, if not already generated
echo "
Initial check if folder $folder_name exists
"
if [ -d "$folder_path" ];
    then
            echo -e "Folder already exists \e[32m\u2714 \e[39m
            "
            echo $splitter
    else
            echo "Creating $folder_name folder in /home/$user/
            "
            mkdir /home/$user/$folder_name
            echo $splitter
fi

#move scripts into folder
echo "
Moving scripts into $folder_path
"
mv *.sh $script_path

#move index file into correct place
echo "
Moving $site_name into apache2 default place (needs sudo)
"
sudo mv $site_name /srv/www/htdocs/

 
