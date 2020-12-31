FROM roundcube/roundcubemail:1.4.x-apache

RUN set -ex; \
    #apt-get update; \
    #apt-get install -y --no-install-recommends \
        #git \
    #; \
    \
# TODO FIXME sometimes getcomposer.org is _not_ resolvable
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer; \
    mv /usr/src/roundcubemail/composer.json-dist /usr/src/roundcubemail/composer.json; \
    \
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist --prefer-stable \
        --no-update --no-interaction \
        --optimize-autoloader --apcu-autoloader \
        require \
#            'roundcube/carddav:dev-master' \
            'roundcube/carddav:*' \
    ; \
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist \
        --no-interaction \
        --optimize-autoloader --apcu-autoloader \
        update; \
    \
    rm -rf /var/lib/apt/lists/* \
    rm -rf /usr/src/php.tar.xz \
    rm -rf /root/.composer/cache/ /usr/bin/composer \
