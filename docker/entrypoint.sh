#!/bin/bash

if [ ! -f "vender/autoload.php" ]; then
    composer install --no-progress --no-interaction
fi

if [ ! -f ".env" ]; then
    cp .env.example .env
fi

exec docker-php-entrypoint "$@"