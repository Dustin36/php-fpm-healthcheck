# 01.04.2023 16:01
FROM php:8.2.5-fpm-alpine3.17

RUN apk add --no-cache fcgi

RUN set -xe && echo "pm.status_path = /status" >> /usr/local/etc/php-fpm.d/zz-docker.conf

COPY ./src/php-fpm-healthcheck /usr/local/bin/

RUN chmod +x /usr/local/bin/php-fpm-healthcheck

HEALTHCHECK --interval=5s --timeout=5s --retries=15 \
    CMD php-fpm-healthcheck || exit 1

WORKDIR /code