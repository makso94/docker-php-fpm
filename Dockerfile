FROM php:8.2-fpm-bullseye

ARG USER=myuser

RUN apt update && \
    apt install -y git unzip vim

RUN cd /tmp && \
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer

RUN groupadd -g 1000 $USER
RUN useradd -m -u 1000 -g 1000 $USER
USER $USER