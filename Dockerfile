FROM ubuntu:16.04

MAINTAINER Amin M

# clean up
RUN apt clean && apt-get update && apt-get upgrade -y

# php required settings
RUN apt install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# apache 2
RUN apt install apache2 -y
RUN a2enmod ssl rewrite

# random
RUN apt install  -y \
	curl zip unzip git software-properties-common

# install PHP
RUN add-apt-repository ppa:ondrej/php -y
RUN apt update
RUN apt install -y php7.2 php7.2-cli php7.2-common php7.2-mbstring php7.2-xml

# PHP composer
RUN curl -sS https://getcomposer.org/installer | php --  --install-dir=/usr/bin --filename=composer

# nodejs latest
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install -y nodejs

# zip extension
#RUN pecl install xdebug apcu redis zlib zip
WORKDIR /var/www/html/

RUN ln -sf /dev/stdout /var/log/apache2/access.log \
    && ln -sf /dev/stderr /var/log/apache2/error.log

CMD ["apachectl", "-d", "/etc/apache2", "-f", "apache2.conf", "-e", "info", "-DFOREGROUND"]
#CMD ["/bin/bash",  "-c",  "tail -f /dev/null"]
#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]

