# symfony-webserver

Just a simple image to run some symfony projects with a default configuration. Base is the official PHP 5.6 image with apache 
webserver.

Features:
* default configuration for symfony 2/3 projects just ready to use
* PHP Acceleration via __opcache__
* __composer__ installed in /usr/bin/composer
* _GIT-Client_ for use with composer
* _ZIP/UNZIP_ for use with composer
* _MYSQL_ and _PDO_ enabled
* _MYSQL Client packages_ installed
* __Symfony 2.0 Projects may need an update (PDO serialize/deserialize issues with newer PHP Version)__ (correct: this issue is doctrine related, not symfony)

This image is used in our hosting projects, so it is actively maintained but as of now it is __NOT__ in a stable state as it is required for any production use.

Webserver is configured to have a Symfony 2/3 file and directory structure in the default hosting. Rewriting is configured to use app.php


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
