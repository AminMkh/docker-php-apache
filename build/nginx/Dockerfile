FROM ubuntu:latest

MAINTAINER Amin M

# clean up
RUN apt clean && apt update && apt upgrade -y

RUN apt install nginx -y

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]
