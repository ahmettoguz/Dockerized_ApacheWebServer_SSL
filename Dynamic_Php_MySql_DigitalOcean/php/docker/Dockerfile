FROM php:8.2-apache

# İlgili modülleri ve ayarları etkinleştirin
RUN docker-php-ext-install pdo_mysql && docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Ana uygulamayı /var/www/soci.us.to klasörüne kopyalayın
COPY . /var/www/soci.us.to

# Copy your Apache configuration file into the image
COPY . /etc/apache2/sites-available/soci.us.to.conf

# PHP ayarları yapın
RUN touch /usr/local/etc/php/php.ini
RUN echo "session.save_path=\"/tmp\"" >> /usr/local/etc/php/php.ini

EXPOSE 80

CMD ["apache2-foreground"]