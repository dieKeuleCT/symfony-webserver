FROM php:5.6-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        wget \
        mysql-client \
        unzip \
        git \
    && docker-php-ext-install -j$(nproc) iconv mcrypt opcache pdo pdo_mysql mysqli mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd
RUN apt-get update && apt-get install -y libmemcached-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached
ADD php.ini /usr/local/etc/php/php.ini
ADD apache2.conf /etc/apache2/apache2.conf
ADD symfony-apache.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
RUN mkdir /composer-setup
RUN wget https://getcomposer.org/installer -P /composer-setup
RUN php /composer-setup/installer --install-dir=/usr/bin

# RUN yes | pecl install xdebug \
#     && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
#     && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
#     && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
