FROM ubuntu:16.04

MAINTAINER Amin M

# clean up
RUN apt clean && apt update && apt upgrade -y

# installing required stuff
RUN apt-get update \
    && apt-get install -y unzip libaio-dev libmcrypt-dev git libzip-dev\
		libmcrypt-dev \
		libpng12-dev \
    && apt-get clean -y

# php required settings
RUN apt install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# house keeping
RUN apt install  -y \
	curl zip unzip git software-properties-common

# install PHP
RUN add-apt-repository ppa:ondrej/php -y
RUN apt update
RUN apt install -y php7.1 php7.1-cli php7.1-common \
    php7.1-mbstring php7.1-xml php7.1-mysqlnd php7.1-pdo-sqlite \
    php7.1-gd php7.1-curl php7.1-zip php7.1-soap php7.1-intl \
    php7.1-fpm

# php fpm
RUN echo "listen = 0.0.0.0:9000" >> /etc/php/7.1/fpm/pool.d/www.conf
RUN service php7.1-fpm start

# PHP composer
RUN curl -sS https://getcomposer.org/installer | php --  --install-dir=/usr/bin --filename=composer

WORKDIR /var/www/html/

CMD ["php-fpm7.1", "-F"]
