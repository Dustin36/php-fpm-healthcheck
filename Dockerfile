FROM php:fpm-alpine3.16

RUN apk add --no-cache fcgi

RUN set -xe && echo "pm.status_path = /status" >> /usr/local/etc/php-fpm.d/zz-docker.conf

COPY ./php-fpm-healthcheck /usr/local/bin/

HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl --fail http://127.0.0.1:3000

WORKDIR /code

RUN chmod +x /usr/local/bin/php-fpm-healthcheck
