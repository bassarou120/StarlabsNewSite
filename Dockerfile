#https://inovector.com/blog/minimal-configuration-docker-to-run-laravel-application
FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    		libfreetype6-dev \
    		libpng-dev \
    		libwebp-dev \
    		libjpeg62-turbo-dev \
    		libmcrypt-dev \
    		libzip-dev \
            zip \
    		git \
    		nano \

    && docker-php-ext-install \
    pdo_mysql \
    gd \
    zip \
    bcmath \
    && a2enmod \
    rewrite

# Add the user UID:1000, GID:1000, home at /app
#RUN groupadd -r app -g 1000 && useradd -u 1000 -r -g app -m -d /app -s /sbin/nologin -c "App user" app && \
#    chmod 755 /var/www/html

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

#upload
RUN echo "file_uploads = On\n" \
         "memory_limit = 500M\n" \
         "upload_max_filesize = 500M\n" \
         "post_max_size = 500M\n" \
         "max_execution_time = 600\n" \
         > /usr/local/etc/php/conf.d/uploads.ini

#USER app

WORKDIR /var/www/html

## Copy existing application directory contents to the working directory
COPY . /var/www/html

RUN chmod -R 777 /var/www/html/public
RUN chmod -R 777 /var/www/html/storage
RUN chmod -R 777 /var/www/html/bootstrap/cache/
RUN chmod -R 777 /var/www/html/storage/app/
RUN chmod -R 777 /var/www/html/storage/logs/
RUN chmod -R 777 /var/www/html/resources/


COPY .env.prod /var/www/html/.env

RUN unzip vendor.zip
#RUN unzip public.zip

WORKDIR /var/www/html

USER root

COPY default.conf /etc/apache2/sites-enabled/000-default.conf

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80




##https://learn2torials.com/a/laravel8-production-docker-image
#FROM php:8.0-fpm
#
## Set working directory
#WORKDIR /var/www
#
## Add docker php ext repo
#ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
#
## Install php extensions
#RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
#    install-php-extensions mbstring pdo_mysql pdo_pgsql redis zip exif pcntl gd memcached intl bcmath  opcache redis uuid
#
#
## Install dependencies
#RUN apt-get update && apt-get install -y \
#    build-essential \
#    libpng-dev \
#    libjpeg62-turbo-dev \
#    libfreetype6-dev \
#    locales \
#    zip \
#    jpegoptim optipng pngquant gifsicle \
#    unzip \
#    git \
#    curl \
#    lua-zlib-dev \
#    libmemcached-dev \
#    nginx
#
## Install supervisor
#RUN apt-get install -y supervisor
#
## Install composer
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#
## Clear cache
#RUN apt-get clean && rm -rf /var/lib/apt/lists/*
#
## Add user for laravel application
#RUN groupadd -g 1000 www
#RUN useradd -u 1000 -ms /bin/bash -g www www
#
## Copy code to /var/www
#COPY --chown=www:www-data . /var/www
#
## add root to www group
#RUN chmod -R ug+w /var/www/storage
#
## Copy nginx/php/supervisor configs
#RUN cp docker/supervisor.conf /etc/supervisord.conf
#RUN cp docker/php.ini /usr/local/etc/php/conf.d/app.ini
#RUN cp docker/nginx.conf /etc/nginx/sites-enabled/default
#
## PHP Error Log Files
#RUN mkdir /var/log/php
#RUN touch /var/log/php/errors.log && chmod 777 /var/log/php/errors.log
#
## Deployment steps
#RUN composer install --optimize-autoloader --no-dev
#RUN chmod +x /var/www/docker/run.sh
#
#EXPOSE 80
#ENTRYPOINT ["/var/www/docker/run.sh"]
#
#
