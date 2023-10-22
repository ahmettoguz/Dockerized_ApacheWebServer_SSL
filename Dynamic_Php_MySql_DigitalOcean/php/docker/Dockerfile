FROM php:8.2-apache

# İlgili modülleri ve ayarları etkinleştirin
RUN docker-php-ext-install pdo_mysql && docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Ana uygulamayı /var/www/html klasörüne kopyalayın
COPY . /var/www/html/

# PHP ayarları yapın
RUN touch /usr/local/etc/php/php.ini
RUN echo "session.save_path=\"/tmp\"" >> /usr/local/etc/php/php.ini

# SSl ile ilgili
RUN a2enmod ssl && a2enmod rewrite
RUN mkdir -p /etc/apache2/ssl

COPY ./apache/ssl/*.pem /etc/apache2/ssl/
COPY ./apache/000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
EXPOSE 443

# RUN ln -s /etc/apache2/mods-available/ssl.load  /etc/apache2/mods-enabled/ssl.load
RUN a2enmod rewrite
RUN a2enmod mime
RUN a2ensite 000-default
RUN service apache2 restart

CMD ["apache2-foreground"]