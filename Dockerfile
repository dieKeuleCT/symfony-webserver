FROM php:5.6-apache
MAINTAINER dieKeuleCT<koehlmeier@gmail.com>
# install some extensions
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2 \
        libxml2-dev \
        wget \
        mysql-client \
        unzip \
        git \
        postfix \
        cron \
        vim \
        inetutils-syslogd \
    && docker-php-ext-install -j$(nproc) iconv intlmcrypt opcache pdo pdo_mysql mysqli mysql mbstring soap xml zip intl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd
# adding some configurations for apache, php
ADD php.ini /usr/local/etc/php/php.ini
ADD apache2.conf /etc/apache2/apache2.conf
ADD symfony-apache.conf /etc/apache2/sites-available/000-default.conf
ADD main.cf /etc/postfix/main.cf
ADD startup.sh /usr/local/startup.sh
# Enable rewrite and install composer for use in symfony 
RUN a2enmod rewrite && mkdir /composer-setup && wget https://getcomposer.org/installer -P /composer-setup && php /composer-setup/installer --install-dir=/usr/bin && rm -Rf /composer-setup && curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && chmod a+x /usr/local/bin/symfony && chmod +x /usr/local/startup.sh

CMD "/usr/local/startup.sh"
