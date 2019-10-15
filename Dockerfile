FROM php:7.3.10-apache

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && docker-php-ext-install pdo_mysql \
    && pecl install apcu \
    && apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    openssl \
    zip unzip \
    mariadb-client \
    libpng-dev \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install pdo_mysql zip \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure gd \
    && docker-php-ext-install gd

COPY ./000-default.conf /etc/apache2/sites-available
RUN a2ensite 000-default.conf \
    && a2enmod rewrite
