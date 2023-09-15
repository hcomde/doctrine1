#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -e "$0")")

# Running composer install
./installComposer.sh

echo "[Doctrine tests] Run test suites"
docker run -it --rm --name doctrine1_tests \
  -v "${SCRIPT_DIR}/../:/usr/src/doctrine1" \
  -w "/usr/src/doctrine1/tests" \
    php:8 php index.php "${@}"
