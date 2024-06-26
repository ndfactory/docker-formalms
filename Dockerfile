# Use the official image as a parent image
FROM php:5.6-apache

# Set the working directory
WORKDIR /var/www/html

# Download latest formalms package 
RUN \
	apt update && \
	apt upgrade -y && \
	apt install -y unzip wget ca-certificates && \
	docker-php-ext-configure mysqli && \
	docker-php-ext-install mysqli && \
	wget --no-dns-cache -O formalms.zip https://sourceforge.net/projects/forma/files/version-3.x/formalms-3.3.22.zip/download && \
	unzip formalms.zip && \
	rm formalms.zip && \
	cp ./formalms/config.dist.php ./formalms/config.php && \
	chmod -R 777 ./formalms/

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 80
EXPOSE 443
