#!/bin/bash

cd `dirname $0`
source container.conf

# The `docker build` command looks into the specified build-context (our directory is also named the same as build-context) path for Dockerfile by default.  
# Dockerfile path needs to be specified using the `-f` option if it is not a part of specified `build-context` directory.
# If Dockerfile was in the same directory as build-docker.sh, we would had to specify its path as `-f ./Dockerfile` since it is not in the build-context directory
docker build $@ \
    --build-arg BASE_IMAGE_NAME=${BASE_IMAGE_NAME} \
    --build-arg BASE_IMAGE_VERSION=${BASE_IMAGE_VERSION} \
    -f Dockerfiles/Dockerfile \
    -t ${CONTAINER} build-context