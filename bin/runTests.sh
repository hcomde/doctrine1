#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -e "$0")")

docker run -it --rm --name doctrine1 \
  -v "${SCRIPT_DIR}/../:/usr/src/doctrine1" \
  -w "/usr/src/doctrine1" \
    php:7.2 php tests/index.php ${@}
