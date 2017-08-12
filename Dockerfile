FROM php:7-apache

# echo PHP version :)
RUN php -v & a2query -v

# installing required stuff
RUN apt-get update
RUN apt-get install -y unzip libaio-dev libmcrypt-dev git libgd2-xpm-dev*

# PHP extensions
RUN \
    docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install zip
  
# PHP composer
RUN curl -sS https://getcomposer.org/installer | php --  --install-dir=/usr/bin --filename=composer

# apache configurations, mod rewrite
RUN a2enmod rewrite
RUN a2enmod ssl

# nodejs latest
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install -y nodejs

# zip extension
RUN pecl install xdebug apcu redis zlib zip
