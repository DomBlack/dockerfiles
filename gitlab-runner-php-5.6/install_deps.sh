#!/bin/bash

set -xe

# Install git (the php image doesn't have it) which is required by composer
apt-get update -yqq
apt-get install git libmemcached-dev libmcrypt-dev zlib1g-dev libxml2-dev libyaml-dev -yqq

# Install phpunit, the tool that we will use for testing
curl --location --output /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-5.7.phar
chmod +x /usr/local/bin/phpunit

# Install mysql driver
# Here you can install any other extension that you need
docker-php-ext-install pdo_mysql
docker-php-ext-install mcrypt
docker-php-ext-install bcmath
docker-php-ext-install soap

echo "\n" | pecl install scrypt
pecl install memcached-2.2.0
pecl install xdebug
pecl install yaml-1.3.1

docker-php-ext-enable scrypt
docker-php-ext-enable memcached
docker-php-ext-enable xdebug
docker-php-ext-enable yaml

echo "date.timezone = \"UTC\"" > /usr/local/etc/php/conf.d/docker-php-timezone.ini

rm -rf /tmp/*
