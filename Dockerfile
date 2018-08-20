FROM php:7.0.31-cli-stretch

LABEL maintainer Linagora Folks <lgs-openpaas-dev@linagora.com>

RUN apt-get update \
    && apt-get -y install unzip git \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

RUN curl https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer.phar \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
