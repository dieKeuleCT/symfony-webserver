# symfony-webserver

## supported tags
### latest: latest php (as of now php 7.1)
### php-7.1: php 7.0 branch, most recent version of PHP 7.1
### php-7.0: php 7.0 branch, most recent version of PHP 7.0
### php-5.6: same image but with php-5.6

Image to run some symfony projects with a default configuration. Base is the official PHP image with apache webserver.
The image can be configured to have mail-delivery (postfix/sendmail wrapper) and cron activated as this is used in most of our projects. But there is no need to have these services enabled - it can be configured to save some server ressources.

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
There is a postfix mta integrated for use with php mail() - configuration see __config-variables__


## config-options

### Webroot
-v [your-wwwroot]:/var/www/html/
### override default hosting config
-v [your-vhost-conf]:/etc/apache2/sites-available/000-default.conf:ro
### override php.ini
-v [your-php.ini]:/usr/local/etc/php/php.ini:ro
### override general apache config 
-v [your-apache2.conf]:/etc/apache2/apache2.conf:ro
### override log directory
-v [your-log-dir]:/var/log/httpd/ 
### crontabs
-v [your-cron-dir]:/var/spool/cron
### for use with reverse proxies (such as nginx)
-v [your-rpaf.conf]:/etc/apache2/mods-available/rpaf.conf
For documentation see https://github.com/gnif/mod_rpaf 

## config-variables
### postfix relay host for sending emails
#### enable email service
-e START_MAILDELIVERY=TRUE enables postfix service at startup
#### enable cron service
-e START_CRON=TRUE enables cron service at startup (if you need some crons in your project)
see also __crontabs__ in __config-options__ 
#### e-mail relaying 
-e RELAY_HOST=<relay>
__the relay host needs to have your ip in trusted__
#### e-mail masquerading
-e MASQ_DOMAINS=<masq domains>


## TODOs
* Variable for debug mode
* php timezone configuration as variable
* Variable or -v for Session - directory for __HA__ use
