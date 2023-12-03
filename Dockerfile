FROM webdevops/php-nginx:8.3

# System level updates

RUN apt update && apt upgrade -y

# Flarum runs in the public/ subfolder, so we change that in nginx. 
# This is reflected in /opt/docker/etc/nginx/vhost.conf,
# which is a convention from webdevops/php-nginx
ENV WEB_DOCUMENT_ROOT=/app/public

# Application level updates

USER application
WORKDIR /app

ARG COMPOSE_EXTIVERSE_KEY
RUN composer create-project flarum/flarum .
RUN composer config repositories.extiverse composer https://extiverse.com/composer/
RUN composer config --global --auth bearer.extiverse.com ${COMPOSE_EXTIVERSE_KEY}
RUN composer require \
        blomstra/s3-assets:"*" \
        blomstra/cache-assets:* \
        blomstra/flarum-redis:* \
        blomstra/horizon:"*" \
        fof/oauth \
        ianm/oauth-reddit \
        fof/upload "*"
# TODO: this is referenced in docs but currently throws: "Command "migrate" is not defined."
# RUN php flarum migrate
# RUN php flarum cache:clear

# System level updates that we have to run after Flarum is installed.
USER root

# This overwrites the existing 10-location-root.conf, otherwise there will
# be "duplicate location /" errors from nginx
RUN cp .nginx.conf /opt/docker/etc/nginx/vhost.common.d/10-location-root.conf

COPY root /

RUN chown -R application:application /app
