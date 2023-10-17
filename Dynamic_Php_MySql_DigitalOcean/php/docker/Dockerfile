#Dockerfile
FROM  php:8.2-apache

RUN docker-php-ext-install pdo_mysql

COPY . /var/www/html/

run touch /usr/local/etc/php/php.ini
run echo "session.save_path=\"/tmp\"" >> /usr/local/etc/php/php.ini
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli \
    && a2enmod headers \
    && sed -ri -e 's/^([ \t]*)(<\/VirtualHost>)/\1\tHeader set Access-Control-Allow-Origin "*"\n\1\2/g' /etc/apache2/sites-available/*.conf

EXPOSE 80

CMD ["apache2-foreground"]



