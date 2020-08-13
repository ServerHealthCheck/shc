# ServerHealthCheck

# How to install on server
  
  Clone this git-repo: 
  
            git clone https://github.com/junglert/shc.git
            
  Edit the /etc/apache2/httpd.conf
  Go to the following line
  
          # List of resources to look for when the client requests a directory
                    DirectoryIndex index.html index.html.var
  
  Add index.php
  
           # List of resources to look for when the client requests a directory
                    DirectoryIndex index.php index.html index.html.var

            
  Execute the init.sh by typing
   
            bash init.sh
  
  The script now prepares everything.
  
  You will be asked to type in your sudo password, because the index.php file needs to be moved into /srv/www/htdocs (default apache folder location)
  
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
      
  # Possible errors

   - file is not getting compiled --> check if you have php7 installed on your host or client
   
      
# Future updates
   - Host and client
   
   - More services
   
   - More system informations
     
   - Wiki / Manual 
    
         
