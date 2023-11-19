# Use the official PHP 8.0 Apache image
FROM php:8.0-apache

# Enable SSL module for Apache
RUN a2enmod ssl

# Copy the PHP application to the container
COPY . /var/www/html/static_Php

# Copy the Apache configuration file
COPY ./src/domain_Conf/dockerizedapache.us.to.conf /etc/apache2/sites-available/dockerizedapache.us.to.conf

# Expose ports 80 and 443
EXPOSE 80
EXPOSE 443

# Generate self signed key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt

# Enable the site configuration
RUN a2ensite dockerizedapache.us.to.conf

# Set the default command to start Apache
CMD ["apache2-foreground"]
