# Setting arguments blank so that the Dockerfile ouputs error if the values are not supplied via docker build command.
ARG BASE_IMAGE_NAME=""
ARG BASE_IMAGE_VERSION=""

# Pulling image specified by the variables passed as arguments to docker build and referring it as `build` for the rest of the Dockerfile. 
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_VERSION} AS build

# Tell apt-get we're never going to be able to give manual feedback
# Needed for tzdata related installs, needed for `build-essential` as it asks for input.
ENV DEBIAN_FRONTEND="noninteractive"
ENV TZ="America/Denver"

# Installing packages required to build 
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    build-essential \
    cmake 

RUN mkdir -p /app/build

# The line below adds all the files inside src in the directory `/app`. 
# Note: It does not add the entire directory per se but the files inside the directory.
ADD src /app

# Sets the working directory to /app.
WORKDIR /app/build

# Generate makefile and run make
RUN cmake .. && make

# Creating Runtime Container with no custom source/additional files
FROM ${BASE_IMAGE_NAME}:${BASE_IMAGE_VERSION} AS runtime_build

# Copying only the HelloWorld executable from `build` into `runtime_build`
# This runtime container will not contain any source files from the `build`
RUN mkdir -p /app
WORKDIR /app
COPY --from=build /app/build/HelloWorld /app

# See Readme.md for ENTRYPOINT vs CMD in Dockerfile
# If no CMD/ENTRYPOINT is provided, /bin/bash is run as default i.e the command line
CMD [ "/app/HelloWorld" ]