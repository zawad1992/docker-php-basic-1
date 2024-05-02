# Use the official PHP image from the dockerhub
FROM php:8.1-fpm-alpine

# Set the working directory
WORKDIR /var/www/html

# Update package list
RUN apk update

# Install dependencies
RUN apk add curl
RUN apk add zip
RUN apk add unzip
RUN apk add git
RUN apk add oniguruma-dev
RUN apk add libpng-dev
RUN apk add libjpeg-turbo-dev
RUN apk add freetype-dev

# Install extensions
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install exif
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install gd
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# Copy existing application directory
# COPY . /var/www/html
COPY . .

# Expose port 9000 and start php-fpm server
EXPOSE 8884
CMD ["php-fpm"]