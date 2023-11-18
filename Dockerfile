#Dockerfile
FROM  php:8.0-apache

WORKDIR /var/www/html/static_Php

COPY . /var/www/html/static_Php

COPY ./src/domain_Conf/soci.us.to.conf /etc/apache2/sites-available/soci.us.to.conf

EXPOSE 80

CMD ["apache2-foreground"]