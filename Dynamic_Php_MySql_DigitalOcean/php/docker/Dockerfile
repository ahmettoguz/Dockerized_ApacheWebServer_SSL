FROM php:8.2-apache

# İlgili modülleri ve ayarları etkinleştirin
RUN docker-php-ext-install pdo_mysql && docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Ana uygulamayı /var/www/html/api klasörüne kopyalayın
COPY . /var/www/html/api

# PHP ayarları yapın
RUN touch /usr/local/etc/php/php.ini
RUN echo "session.save_path=\"/tmp\"" >> /usr/local/etc/php/php.ini

EXPOSE 80

CMD ["apache2-foreground"]