FROM php:5-fpm

RUN docker-php-ext-install mbstring

WORKDIR /var/www