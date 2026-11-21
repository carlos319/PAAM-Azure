FROM php:8.3-apache

ARG MOODLE_BRANCH=MOODLE_405_STABLE

RUN apt-get update && apt-get install -y --no-install-recommends \
      git unzip libpng-dev libjpeg-dev libfreetype6-dev libzip-dev \
      libicu-dev libxml2-dev libldap2-dev \
 && docker-php-ext-configure gd --with-jpeg --with-freetype \
 && docker-php-ext-install -j$(nproc) gd intl mysqli zip soap exif opcache ldap \
 && pecl install apcu && docker-php-ext-enable apcu \
 && a2enmod rewrite headers \
 && rm -rf /var/lib/apt/lists/*

RUN { echo 'memory_limit=256M'; echo 'max_execution_time=120'; \
      echo 'max_input_vars=5000'; echo 'post_max_size=100M'; \
      echo 'upload_max_filesize=100M'; } > /usr/local/etc/php/conf.d/moodle.ini

RUN git clone -b ${MOODLE_BRANCH} --depth 1 https://github.com/moodle/moodle.git /var/www/html \
 && mkdir -p /var/moodledata \
 && chown -R www-data:www-data /var/www/html /var/moodledata
