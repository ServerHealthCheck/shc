# ServerHealthCheck

# How to install and get started
  
  Clone this git-repo: 
  
            git clone https://github.com/junglert/ServerHealthCheck.git
            
  Edit the /etc/apache2/httpd.conf
  Go to the following line
  
          # List of resources to look for when the client requests a directory
                    DirectoryIndex index.html index.html.var
  
  Add index.php
  
           # List of resources to look for when the client requests a directory
                    DirectoryIndex index.php index.html index.html.var

  Make sure you got the apache2 module for php parsing
  
            apache2-mod_php7
     
  Install this module and activate it by typing
  
            sudo a2enmod php7
            
  Restart the apache2 service
  
            sudo systemctl restart apache2.service
            
  Execute the init.sh by typing
   
            bash init.sh
  
  The script now prepares everything.
  
  You will be asked to type in your sudo password, because the index.php file needs to be moved into /srv/www/htdocs (default apache folder location)
  
  # Possible errors

   - 
     
 
# Future updates
   
   - More services
   
   - More system informations
     
   - Wiki / Manual 
    
         
