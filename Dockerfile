FROM php:8.2-apache as PHP

RUN apt-get update -y
RUN apt-get install -y unzip libpq-dev libcurl4-gnutls-dev
RUN docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR /var/www
COPY . .

# COPY --from=composer:2.3.5 usr/local/bin/composer /usr/local/bin/composer

ENV PORT=80
ENTRYPOINT [ "docker/entrypoint.sh" ]