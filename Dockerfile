#Dockerfile
FROM  php:8.0-apache

WORKDIR /var/www/html/static_Php

COPY . /var/www/html/static_Php

COPY ./src/domain_Conf/dockerizedapache.us.to.conf /etc/apache2/sites-available/dockerizedapache.us.to.conf

EXPOSE 80

CMD ["apache2-foreground"]