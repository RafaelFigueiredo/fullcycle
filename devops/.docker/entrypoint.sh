#!/bin/sh
cd /var/www

php artisan migrate
php artisan key:generate

php-fpm