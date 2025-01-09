# Imagen base
FROM php:8.2-fpm

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Instalar Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Crear el directorio de trabajo
WORKDIR /app/backend

# Copiar archivos del proyecto
COPY . .

# Instalar dependencias
RUN composer install --no-dev --optimize-autoloader

# Permisos para almacenamiento y caché
RUN chown -R www-data:www-data /app/backend/storage /app/backend/bootstrap/cache

# Exponer el puerto 8008
EXPOSE 8008

# Comando para ejecutar el servidor Artisan
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8008"]
