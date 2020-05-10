FROM php:7.4-apache

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && pecl install apcu \
    && apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    openssl \
    zip unzip \
    mariadb-client \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    librabbitmq-dev \
    && pecl install amqp \
    && docker-php-ext-enable amqp \
    && apt-get -yqq install exiftool \
    && docker-php-ext-configure exif \
    && docker-php-ext-install exif \
    && docker-php-ext-enable exif \
    && docker-php-ext-enable apcu \
#    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-configure zip \
    && docker-php-ext-install pdo_mysql zip

COPY ./000-default.conf /etc/apache2/sites-available
RUN a2ensite 000-default.conf \
    && a2enmod rewrite
