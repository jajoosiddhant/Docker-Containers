#!/bin/bash

cd `dirname $0`
source container.conf

# Use various docker run options to add volumes, device and much more
# name -> names the container
# -it -> starts the container interactively
# --pid=host -> Shares the pid namespace with the host machine
# --rm -> Removes the container onces it exits.
# -d -> Runs the container in detached mode i.e in the background
# -it -> For interactive processes (like a shell), use -i -t together in order to allocate a tty for the container process.
docker run $@ \
    --rm \
    --pid=host \
    --name ${CONTAINER_NAME} \
    -it ${CONTAINER}