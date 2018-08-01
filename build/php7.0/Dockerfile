FROM ubuntu:16.04


RUN echo 123
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
RUN apt install -y php7.0 php7.0-cli php7.0-common \
    php7.0-mbstring php7.1-xml php7.0-mysqlnd php7.1-pdo-sqlite \
    php7.0-gd php7.0-curl php7.0-zip php7.0-soap php7.0-intl \
    php7.0-fpm php7.0-apcu

# php fpm
RUN echo "listen = 0.0.0.0:9000" >> /etc/php/7.0/fpm/pool.d/www.conf
RUN service php7.0-fpm start

# PHP composer
RUN curl -sS https://getcomposer.org/installer | php --  --install-dir=/usr/bin --filename=composer

WORKDIR /var/www/html/

CMD ["php-fpm7.0", "-F"]
