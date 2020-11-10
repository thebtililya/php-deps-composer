FROM php:7.4.11-cli

LABEL maintainer Linagora Folks <lgs-openpaas-dev@linagora.com>

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-19.03.0-ce.tgz \
    && tar xzvf docker-19.03-ce.tgz \
    && mv docker/docker /usr/local/bin \
    && rm -r docker docker-19.03.0-ce.tgz

RUN apt-get update \
    && apt-get -y install unzip git \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install bcmath
RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

RUN curl https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer.phar \
    && ln -s /usr/local/bin/composer.phar /usr/local/bin/composer
