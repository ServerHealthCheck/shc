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
folder_check(){ #generate folder for the scripts, if not already generated
echo "
Initial check if folder $folder_name exists
"
if [ -d "$final_path" ];
    then
            echo "Folder already exists
            "
    else
            echo "Creating $folder_name folder in /home/$user/
            "
            mkdir ${final_path}
fi
}

script_move(){ #move scripts into folder
echo "
Moving scripts into $final_path
"
cd shc_scripts/
cp *.sh $final_path
cd ..
}

index_move(){ #move index file into correct place
echo "
Moving $site_name into apache2 default place (needs sudo)
"
sudo cp $site_name /srv/www/htdocs/

echo "
You can now access the site by typing the ip into the url field in your browser.
For any help, please consult the Readme or open a new issue.
"
}

folder_check
script_move
index_move
