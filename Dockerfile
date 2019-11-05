FROM php:7.3.10-apache

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
RUN pecl install apcu \
RUN apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    openssl \
    zip unzip \
    mariadb-client \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
RUN apt-get -yqq install exiftool \
RUN docker-php-ext-configure exif \
RUN docker-php-ext-install exif \
RUN docker-php-ext-enable exif \
RUN docker-php-ext-enable apcu \
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
RUN docker-php-ext-install gd \
RUN docker-php-ext-configure zip --with-libzip \
RUN docker-php-ext-install pdo_mysql zip

COPY ./000-default.conf /etc/apache2/sites-available
RUN a2ensite 000-default.conf \
    && a2enmod rewrite
