#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -e "$0")")

docker run -it --rm --tty --name doctrine1_composer --user "$(id -u):$(id -g)" \
  -v "${SCRIPT_DIR}/../:/app" \
    composer:2.2 install --optimize-autoloader

docker run -it --rm --name doctrine1 \
  -v "${SCRIPT_DIR}/../:/usr/src/doctrine1" \
  -w "/usr/src/doctrine1/tests" \
    php:8 php index.php ${@}
