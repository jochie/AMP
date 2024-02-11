FROM php:5.5-apache

RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli
COPY local.ini /usr/local/etc/php/conf.d/
