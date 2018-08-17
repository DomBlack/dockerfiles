#!/bin/bash

set -xe

# Install git (the php image doesn't have it) which is required by composer
apt-get update -yqq
apt-get install git wget libmemcached-dev libmcrypt-dev zlib1g-dev libxml2-dev libyaml-dev libpng-dev zlib1g-dev libicu-dev g++ gnupg zip unzip -yqq

# Install phpunit, the tool that we will use for testing
curl --location --output /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-7.phar
chmod +x /usr/local/bin/phpunit

# Install noded
curl -sL https://deb.nodesource.com/setup_9.x | bash -
apt-get install -y nodejs

# Install an up to date ICU
curl -fsS -o /tmp/icu.tgz -L http://download.icu-project.org/files/icu4c/62.1/icu4c-62_1-src.tgz \
  && tar -zxf /tmp/icu.tgz -C /tmp \
  && cd /tmp/icu/source \
  && ./configure --prefix=/usr/local \
  && make \
  && make install \
  && cd /

# PHP_CPPFLAGS are used by the docker-php-ext-* scripts
export PHP_CPPFLAGS="$PHP_CPPFLAGS -std=c++11"

# Install mysql driver
# Here you can install any other extension that you need
docker-php-ext-install pdo_mysql
docker-php-ext-install bcmath
docker-php-ext-install soap
docker-php-ext-install gd
docker-php-ext-install zip

docker-php-ext-configure intl --with-icu-dir=/usr/local
docker-php-ext-install intl

echo "\n" | pecl install scrypt
pecl install memcached
pecl install xdebug
pecl install yaml

docker-php-ext-enable scrypt
docker-php-ext-enable memcached
docker-php-ext-enable xdebug
docker-php-ext-enable yaml

echo "date.timezone = \"UTC\"" > /usr/local/etc/php/conf.d/docker-php-timezone.ini

wget https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer -O - -q | php

rm -rf /tmp/*
