FROM php:8.2-apache

# İlgili modülleri ve ayarları etkinleştirin
RUN docker-php-ext-install pdo_mysql && docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Enable Apache module using Apache configuration
RUN a2enmod ssl && a2enmod rewrite
RUN mkdir -p /etc/apache2/ssl
COPY ../conf/ssl/*.pem /etc/apache2/ssl/
COPY ../conf/000-default.conf /etc/apache2/sites-available/

# Ana uygulamayı /var/www/html klasörüne kopyalayın
COPY . /var/www/html/

# PHP ayarları yapın
RUN touch /usr/local/etc/php/php.ini
RUN echo "session.save_path=\"/tmp\"" >> /usr/local/etc/php/php.ini

# Enable the 000-default.conf site 
RUN a2ensite 000-default

EXPOSE 80
EXPOSE 443

CMD ["apache2-foreground"]