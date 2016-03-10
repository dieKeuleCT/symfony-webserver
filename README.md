# symfony-webserver

Just a simple image to run some symfony projects with a default configuration. Base is the official PHP image with apache 
webserver.

Webserver is configured to have a Symfony 2/3 file/directory structure in the default hosting. Rewriting is configured 
to use app.php


## config-options

### Webroot
-v [your-wwwroot]:/var/www/html/
### override default hosting config
-v [your-vhost-conf]:/etc/apache2/sites-available/000-default.conf
### override php.ini
-v [your-php.ini]:/usr/local/etc/php/php.ini
### override general apache config 
-v [your-apache2.conf]:/etc/apache2/apache2.conf
### override log directory
-v [your-log-dir]:/var/log/httpd/ 


## TODOs
* Variable for debug mode
* apc or accelerator
* php timezone configuration as variable
* symfony specifics inside the container for use with docker -it exec name bash
* Variable or -v for Session - directory for __HA__ use
* database abilites of php configuration
