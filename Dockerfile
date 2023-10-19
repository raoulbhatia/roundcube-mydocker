FROM roundcube/roundcubemail:1.6.x-apache
#COPY composer.json-1.4 /usr/src/roundcubemail/composer.json

RUN set -ex; \
    #apt-get update; \
    #apt-get install -y --no-install-recommends \
        #git \
    #; \
    \
# TODO FIXME sometimes getcomposer.org is _not_ resolvable
    #curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer; \
    #mv /usr/src/roundcubemail/composer.json-dist /usr/src/roundcubemail/composer.json; \
    #chown -R www-data:www-data /usr/src/roundcubemail/; \
    \
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist --prefer-stable \
        --update-no-dev --no-interaction \
        --optimize-autoloader --apcu-autoloader \
        require \
#            'roundcube/carddav:dev-master' \
            'roundcube/carddav:*' \
    ; \
    \
    rm -rf /var/lib/apt/lists/* \
        /usr/src/php.tar.xz \
        /root/.composer/cache/
