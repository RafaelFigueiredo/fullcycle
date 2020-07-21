FROM composer:1.10.8 as build

WORKDIR /app
RUN composer create-project laravel/laravel .


FROM php:7-fpm-alpine as release
RUN apk add --no-cache --upgrade bash
RUN apk add --no-cache openssl
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN apk add --no-cache shadow
RUN docker-php-ext-install pdo pdo_mysql

RUN rm -rf /var/www/html
COPY --from=build /app /var/www

WORKDIR /var/www
RUN ln -s public html

COPY entrypoint.sh /entrypoint.sh

RUN usermod -u 1000 www-data
USER www-data

EXPOSE 9000
CMD ["php-fpm"]




