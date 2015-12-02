FROM ubuntu:15.04
MAINTAINER "Alexander Trauzzi" <alex@inviid.com>

WORKDIR /var/www

RUN apt-get install -y python curl

RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y git nodejs default-jdk ant ant-contrib

RUN apt-get install -y \
	php5-cli \
	php5-cgi \
	php5-imagick \
	php5-mysql \
	php5-pgsql \
	php5-redis \
	php5-json \
	php5-mcrypt \
	php5-curl \
	php5-memcached

RUN php5enmod mcrypt
RUN php5enmod -s cli opcache

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN echo opcache.enable = 1 | tee /etc/php5/cli/php.ini
RUN echo opcache.enable_cli = 1 | tee /etc/php5/cli/php.ini

RUN curl -sS https://phar.phpunit.de/phpunit.phar --output /usr/local/bin/phpunit