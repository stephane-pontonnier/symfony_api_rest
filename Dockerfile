FROM php:8.4-fpm

# Dépendances système
RUN apt-get update && apt-get install -y \
    git unzip libzip-dev \
    libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql zip gd

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

# Copier uniquement les fichiers nécessaires
COPY composer.json composer.lock ./

# Installer les dépendances SANS scripts
RUN composer install --no-scripts --no-interaction --prefer-dist

# Copier le reste du projet
COPY . .

EXPOSE 9000

CMD ["php-fpm"]
