# ServerHealthCheck
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![GitHub contributors](https://img.shields.io/github/contributors/Naereen/StrapDown.js.svg)](https://github.com/junglert/shc/graphs/contributors)
[![GitHub version](https://d25lcipzij17d.cloudfront.net/badge.svg?id=gh&type=6&v=3.2)](https://github.com/junglert/shc/releases/tag/shc_v3.2)

The easy way to display information about your device - made with php and shell

### Now with dark-theme!

# How to install on server
  
  Clone this git-repo: 
  
	git clone https://github.com/junglert/shc.git
            
 
  Go into the shc folder
  
 	cd shc/
	   
  Execute the init.sh by typing
   
	bash init.sh
  
  You will be asked to type in your sudo password, because the index.php file needs to be moved into /srv/www/htdocs (default apache folder location)
  
  The script now prepares everything.
  
  
  # If you want to use Host/Client functions
  
  Edit the /etc/hosts file of your client
  
  Add the following line beneath the localhost line
  
      127.0.1.1 localost.localdomain localhost $your_prefered_name
  
  Add both of your domain-hostnames to the index.php file you find in /srv/www/htdocs/ behind the "http://" tag
  
      <ul>	
	       <li style="float:left"><a href="http://">Host</a></li> <?php //Add your own host http://hostname_host/ ?>
	       <li style="float:center"><a href="http://">RemoteClient</a></li> <?php //Add your own client http://hostname_client/ ?>
      </ul>
      
   Install this git and exec the init.sh
      
     
# Future updates
   - Host and client
   
   - More services
   
   - More system informations
     
   - Wiki / Manual 
    
   - Docker      
