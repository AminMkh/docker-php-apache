FROM ubuntu:latest

LABEL maintainer="AminMukh@docker"

ENV DEBIAN_FRONTEND noninteractive
# clean up
RUN apt clean && apt update && apt upgrade -y

# installing required stuff
RUN apt-get update \
    && apt-get install -y unzip libaio-dev libmcrypt-dev git libzip-dev\
		libmcrypt-dev \
		libpng-dev \
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

# PHP repos
RUN add-apt-repository ppa:ondrej/php -y
RUN apt update

ARG v=8.1

# PHP install
RUN apt install -y php$v php$v-cli php$v-common \
    php$v-mbstring php$v-xml php$v-mysqlnd php$v-pdo-sqlite \
    php$v-gd php$v-curl php$v-zip php$v-soap php$v-intl \
    php$v-fpm php$v-apcu

# PHP fpm
RUN echo "listen = 0.0.0.0:9000" >> /etc/php/$v/fpm/pool.d/www.conf
RUN service php$v-fpm start

# PHP composer
RUN curl -sS https://getcomposer.org/installer | php --  --install-dir=/usr/bin --filename=composer

WORKDIR /var/www/html/

# add laravel aliases
ENV cmd "php-fpm${v}"
CMD ${cmd} -F
