FROM php:8.1.27-cli

# Install Phalcon
RUN pecl channel-update pecl.php.net \
    && pecl install phalcon-5.6.2 \
    && docker-php-ext-enable phalcon

# Install memprof
RUN apt update && apt install libjudy-dev gdb -y \
    && pecl install memprof \
    && docker-php-ext-enable memprof

RUN apt update && apt install -y gdb wget

# COMPOSER
RUN wget https://getcomposer.org/installer ; php installer ; mv composer.phar /usr/local/bin/composer


WORKDIR /var/www/test
CMD /bin/bash -c "composer install && php -f index.php; tail -f /dev/null"