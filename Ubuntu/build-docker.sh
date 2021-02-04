#!/bin/bash

cd `dirname $0`
source container.conf

docker build $@ \
    --build-arg BASE_IMAGE_NAME=${BASE_IMAGE_NAME} \
    --build-arg BASE_IMAGE_VERSION=${BASE_IMAGE_VERSION} \
    -t ${CONTAINER} .