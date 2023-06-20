FROM php:8.2-fpm

WORKDIR /var/www/html

COPY . .

RUN apt-get update && \
    apt-get install -y \
    git \
    unzip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# COPY conf/vhosts.conf /etc/apache2/sites-available/000-default.conf

RUN composer install

# RUN php bin/console doctrine:database:create
# RUN php bin/console doctrine:migrations:migrate
# RUN php bin/console doctrine:fixtures:load --no-interaction

EXPOSE 9000

CMD ["php-fpm"]