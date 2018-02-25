FROM ubuntu:16.04

MAINTAINER Amin M

# clean up
RUN apt clean && apt update && apt upgrade -y

RUN apt install apache2 -y

sudo apt-get install php libapache2-mod-php
sudo apt-get install libapache2-mod-fastcgi php7.0-fpm

RUN a2enmod proxy proxy_fcgi
RUN a2enmod rewrite

#
## forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/apache2/access.log \
	&& ln -sf /dev/stderr /var/log/apache2/error.log \
	&& ln -sf /dev/stderr /var/log/apache2/other_vhosts_access.log

CMD /usr/sbin/apache2ctl -D FOREGROUND
