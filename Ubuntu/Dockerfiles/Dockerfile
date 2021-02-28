# Setting arguments blank so that the Dockerfile ouputs error if the values are not supplied via docker build command.
ARG BASE_IMAGE_NAME=""
ARG BASE_IMAGE_VERSION=""

# Pulling image specified by the variables passed as arguments to docker build and referring it as `build` for the rest of the Dockerfile. 
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_VERSION} AS build

RUN mkdir -p /app

# The line below adds all the files inside src in the directory `/app`. 
# Note: It does not add the entire directory per se but the files inside the directory.
ADD src /app

# Sets the working directory to /app.
WORKDIR /app

# See Readme.md for ENTRYPOINT vs CMD in Dockerfile
# If no CMD/ENTRYPOINT is provided, /bin/bash is run as default i.e the command line
CMD [ "/app/hello-world.sh" ]