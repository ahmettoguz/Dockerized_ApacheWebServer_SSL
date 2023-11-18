# Use the official PHP 8.0 Apache image
FROM php:8.0-apache

# Install Certbot and its Apache plugin
RUN apt-get update && \
    apt-get install -y certbot python3-certbot-apache

# Install mkcert
RUN apt-get install -y libnss3-tools

# Enable SSL module for Apache
RUN a2enmod ssl

# Copy the PHP application to the container
COPY . /var/www/html/static_Php

# Copy the Apache configuration file
COPY ./src/domain_Conf/soci.us.to.conf /etc/apache2/sites-available/soci.us.to.conf

# Expose ports 80 and 443
EXPOSE 80
EXPOSE 443

# Enable the site configuration
RUN a2ensite soci.us.to.conf

# Set the default command to start Apache
CMD ["apache2-foreground"]
