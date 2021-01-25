ARG PHP_VERSION
FROM php:$PHP_VERSION-cli

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN \
    printf '#!/usr/bin/env bash \n\
set -e \n\
set -o pipefail \n\
apt-get -qq update \n\
apt-get -y --no-install-recommends install $@ \n\
rm -rf /var/lib/apt/lists/*' > /usr/local/bin/docker-apt-get-install && chmod +x /usr/local/bin/docker-apt-get-install

ARG PHP_STEMMER_VERSION=master
RUN docker-apt-get-install \
        libstemmer-dev \
    && curl -s -L -o /tmp/php-stemmer.tar.gz https://github.com/werkspot/php-stemmer/archive/${PHP_STEMMER_VERSION}.tar.gz \
    && tar -C /tmp/ -zxf /tmp/php-stemmer.tar.gz \
    && docker-php-ext-configure /tmp/php-stemmer-${PHP_STEMMER_VERSION} \
    && docker-php-ext-install /tmp/php-stemmer-${PHP_STEMMER_VERSION} \
    && rm -rf /tmp/php-stemmer.tar.gz /tmp/php-stemmer-${PHP_STEMMER_VERSION}

WORKDIR /var/www/html

RUN printf '<?php  \n\n\
echo stemword("dakpannen", "dutch", "UTF_8") . "\n" ; \n\
assert(stemword("dakpannen", "dutch", "UTF_8") === "dakpann"); \n\
echo stemword("balletje", "dutch", "UTF_8") . "\n" ; \n\
assert(stemword("balletje", "dutch", "UTF_8") === "balletj"); ' > test.php

ENTRYPOINT ["php"]

CMD ["test.php"]