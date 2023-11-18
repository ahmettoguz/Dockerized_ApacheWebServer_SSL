#Dockerfile
FROM  php:8.0-apache

RUN apt-get update && \
    apt-get install -y certbot

COPY . /var/www/html/static_Php

COPY ./src/domain_Conf/soci.us.to.conf /etc/apache2/sites-available/soci.us.to.conf

EXPOSE 80
EXPOSE 443

RUN a2ensite soci.us.to.conf
CMD ["apache2-foreground"]