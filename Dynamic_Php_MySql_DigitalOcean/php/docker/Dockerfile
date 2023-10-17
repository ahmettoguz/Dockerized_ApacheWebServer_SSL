#Dockerfile
FROM  php:8.2-apache

RUN docker-php-ext-install pdo_mysql

COPY . /var/www/html/

run touch /usr/local/etc/php/php.ini
run echo "session.save_path=\"/tmp\"" >> /usr/local/etc/php/php.ini

EXPOSE 80

CMD ["apache2-foreground"]



