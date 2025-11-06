#!/bin/bash
set -e

export COMPOSER_TAG="2.8.12"
export PHP_VERSION="8.4"
export DOCKERFILE="php82_84"
export PHP_IMAGE_TAG="local/hcomde/doctrine1/${DOCKERFILE}:${PHP_VERSION}"
