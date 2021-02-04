# Docker-Containers
Readily available examples of Docker Containers to build and run different applications.  
Each directory consists of `build-docker.sh` and `run-docker.sh` scripts to build respective docker container.  
All the different containers listed in this repository will follow the same format.  
Look for inline comments in `build-docker.sh`, `run-docker.sh` and `Dockerfile` to learn more about docker.  
 
## PREREQUISITE TO BUILD DOCKER CONTAIHNER  
Rename the `container.conf.template` file to `container.conf` file and populate the variables with the required contents.  
OR  
Create a file `container.conf` with the contents similar to `container.conf.template` in the same directory.

## HOWTO build Docker container  
Run `build-docker.sh` to build the container.
Add the optional argument `--no-cache` to run the container from scratch.    

## HOWTO run Docker container     
Run `run-docker.sh` to run the container after building it.


## General Information about Docker Containers    
 - Each instruction in `Dockerfile` creates a layer.
 - `--build-arg` is used to pass variable values inside Dockerfile. This is used in various `build-docker.sh` scripts and also in `Dockerfile` in this repository. This limits the docker container to fail in case no variable value is passed.   
 - `-f` option in `docker build` is used to change the name of `Dockerfile` to any arbirtary filename. By default, the `docker build` command would look for the docker file named `Dockerfile` in the directory specified as an argument in the `docker build` command. The `build-script.sh` uses `.` signifying current working directory.  
 - All the src files that needs to be added in the docker conatainer should be present in the same directory as `Dockerfile` or in a sub-directory of the directory containing `Dockerfile`. Any commands used such as `COPY` OR `ADD` won't work for the source files if they are placed atleast one directory up from the directory consisting the `Dockerfile`.  
 - Best Practice for sending the minimum build-context in Docker:  
    See: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/    
 - `privileged` gives root access of the host to the docker container. It automatically passess all the device nodes i.e `/dev` and `/proc`, `/sys` partitions.
