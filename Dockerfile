#Dockerfile
FROM  php:8.0-apache

# Install Certbot and its Apache plugin
RUN apt-get update && \
    apt-get install -y certbot python3-certbot-apache && \
    rm -rf /var/lib/apt/lists/*

# Enable SSL module for Apache
RUN a2enmod ssl

COPY . /var/www/html/static_Php

COPY ./src/domain_Conf/soci.us.to.conf /etc/apache2/sites-available/soci.us.to.conf

EXPOSE 80
EXPOSE 443

# RUN a2ensite soci.us.to.conf
CMD ["apache2-foreground"]