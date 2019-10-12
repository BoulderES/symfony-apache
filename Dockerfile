FROM composer as backend

WORKDIR /app

RUN composer create-project symfony/skeleton project \
    && cd project \
    && composer install

FROM php:7.3.10-apache

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && docker-php-ext-install pdo_mysql \
    && pecl install apcu \
    && apt-get update && apt-get install -y \
    zlib1g-dev \
    libzip-dev \
    && docker-php-ext-install zip \
    && docker-php-ext-enable apcu

COPY ./000-default.conf /etc/apache2/sites-enabled

WORKDIR /var/www/html

COPY --from=backend /app /var/www