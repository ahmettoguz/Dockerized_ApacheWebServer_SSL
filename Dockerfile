# Use the official PHP 8.0 Apache image
FROM php:8.0-apache

# Copy the PHP application to the container
COPY . /var/www/html/static_Php

# Copy the Apache configuration file
COPY ./src/domain_Conf/dockerizedapache.us.to.conf /etc/apache2/sites-available/dockerizedapache.us.to.conf

# Enable SSL module for Apache
RUN a2enmod ssl

# Generate self-signed SSL certificate non-interactively
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/apache-selfsigned.key \
    -out /etc/ssl/certs/apache-selfsigned.crt \
    -subj "/C=US/ST=dockerizedapache/L=dockerizedapache/O=dockerizedapache/OU=dockerizedapache/CN=dockerizedapache.us.to"

# Expose ports 80 and 443
EXPOSE 80
EXPOSE 443

# Enable the site configuration
RUN a2ensite dockerizedapache.us.to.conf

# Set the default command to start Apache
CMD ["apache2-foreground"]