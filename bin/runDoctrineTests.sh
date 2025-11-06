#!/bin/bash
set -e

SCRIPT_DIR=$(dirname "$(readlink -e "$0")")
source ${SCRIPT_DIR}/projectVars.sh

# Running composer install
${SCRIPT_DIR}/runComposer.sh install

echo "[Doctrine tests] Run test suites"
docker run -it --rm --name doctrine1_tests \
  -v "${SCRIPT_DIR}/../:/usr/src/doctrine1" \
  -w "/usr/src/doctrine1/tests" \
    ${PHP_IMAGE_TAG} php index.php "${@}"
