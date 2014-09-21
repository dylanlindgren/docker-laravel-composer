FROM php-cli:latest

MAINTAINER "Dylan Lindgren" <dylan.lindgren@gmail.com>

RUN mkdir -p /data/www
WORKDIR /data/www

RUN apt-get update -y && \
    apt-get install -y curl git && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN useradd --uid 2000 composer
USER composer

ENTRYPOINT ["composer"]
CMD ["--help"]
