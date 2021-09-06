#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -e "$0")")

docker run -it --rm --name doctrine1 \
  -v "${SCRIPT_DIR}/../:/usr/src/doctrine1" \
  -w "/usr/src/doctrine1/var/tmp" \
    php:8 php ../../tests/index.php ${@}
