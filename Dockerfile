FROM php:8.1-fpm
RUN apt-get update && apt-get install -y \
    ffmpeg \
    cron \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick mongodb \
	&& docker-php-ext-enable imagick \
	&& docker-php-ext-enable mongodb \
