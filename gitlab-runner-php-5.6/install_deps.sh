#!/bin/bash
set -xe

# Install git (the php image doesn't have it) which is required by composer
apt-get update -yqq
apt-get install git libmemcached-dev libmcrypt-dev zlib1g-dev -yqq

# Install phpunit, the tool that we will use for testing
curl --location --output /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar
chmod +x /usr/local/bin/phpunit

# Install mysql driver
# Here you can install any other extension that you need
docker-php-ext-install pdo_mysql
docker-php-ext-install mcrypt
docker-php-ext-install bcmath

echo "\n" | pecl install scrypt

pecl install memcache
pecl install memcached
pecl install APC

docker-php-ext-enable scrypt
docker-php-ext-enable memcache
docker-php-ext-enable memcached
docker-php-ext-enable APC

echo "date.timezone = \"UTC\"" > /usr/local/etc/php/conf.d/docker-php-timezone.ini
echo "apc.enable_cli = 1" > /usr/local/etc/php/conf.d/docker-php-apc.ini
