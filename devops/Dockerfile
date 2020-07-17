FROM composer:1.10.8 as build

WORKDIR /app
RUN composer create-project laravel/laravel .


FROM php:7-fpm-alpine as release
RUN apk add --no-cache shadow
RUN docker-php-ext-install pdo pdo_mysql

RUN rm -rf /var/www/html
COPY --from=build /app /var/www

WORKDIR /var/www
RUN ln -s public html

RUN usermod -u 1000 www-data
USER www-data

EXPOSE 9000
CMD ["php-fpm"]
# CMD ["php", "artisan", "serve", "--host=0.0.0.0"]



