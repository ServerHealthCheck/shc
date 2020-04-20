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
home_path="$HOME"
final_path="$home_path/$folder_name"

#functions
#generate folder for the scripts, if not already generated
folder_check(){
echo "
Initial check if folder $folder_name exists
"
if [ -d "$final_path" ];
    then
            echo -e "Folder already exists \e[32m\u2714 \e[39m
            "
    else
            echo "Creating $folder_name folder in /home/$user/
            "
            mkdir ${final_path}
fi
}

#move scripts into folder
script_move(){
echo "
Moving scripts into $final_path
"
cd shc_scripts/
cp *.sh $final_path
cd ..
}


#move index file into correct place
index_move(){
echo "
Moving $site_name into apache2 default place (needs sudo)
"
sudo cp $site_name /srv/www/htdocs/

echo "
Now you can access the apachesite by typing http://localhost
For any help consult the Readme"
}

folder_check
script_move
index_move
