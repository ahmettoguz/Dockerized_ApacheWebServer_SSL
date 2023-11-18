#Dockerfile
FROM  php:8.0-apache

COPY . /var/www/html/static_Php

EXPOSE 80

CMD ["apache2-foreground"]