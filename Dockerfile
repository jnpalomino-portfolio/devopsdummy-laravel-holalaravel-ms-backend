FROM --platform=linux/amd64 php:8.2-fpm-alpine

# Instalar dependencias esenciales
RUN apk add --no-cache \
    git \
    zip \
    unzip \
    libpng-dev \
    libzip-dev \
    && docker-php-ext-install pdo_mysql bcmath gd zip \
    && rm -rf /var/cache/apk/*

# Instalar Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Crear directorio de trabajo
WORKDIR /app/backend

# Copiar solo los archivos necesarios primero
COPY composer.json composer.lock ./

# Instalar dependencias de producción
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Copiar el resto de la aplicación
COPY . .

# Configurar permisos
RUN chgrp -R 0 /app
RUN chmod -R g=u /app

EXPOSE 8008

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8008"]
