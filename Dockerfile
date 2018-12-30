FROM php:7-apache-stretch
RUN apt-get update \
    && apt-get install -y libpng-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install gd
COPY redaxo /var/www/html/
RUN chmod -R 755 /var/www/html \
    && chown -R www-data:www-data /var/www/html
