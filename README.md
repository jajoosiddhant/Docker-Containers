# Docker-Containers
Readily available examples of Docker Containers to build and run different applications.  
Each directory consists of `build-docker.sh` and `run-docker.sh` scripts to build respective docker container.  
All the different containers listed in this repository will follow the same format.  
Look for inline comments in `build-docker.sh`, `run-docker.sh` and `Dockerfile` to learn more about docker.  
 
## Prerequisites for building docker containers  
Type `docker` on commandline to see if docker is installed.
If not, install the docker container using [docker-install.sh](docker-install.sh) script.  
Rename the `container.conf.template` file to `container.conf` file and populate the variables with the required contents.  
OR  
Create a file `container.conf` with the contents similar to `container.conf.template` in the same directory.
 
 
## HOWTO build docker container  
Run `build-docker.sh` to build the container.
Add the optional argument `--no-cache` to run the container from scratch.    
 
 
## HOWTO run docker container     
Run `run-docker.sh` to run the container after building it.
`run-docker-shell.sh` can be used to open command line instead of directly executing the application.  
  

# Container Types  

- [Ubuntu](Ubuntu) - This is a simple ubuntu docker container which runs a simple bash script after building and running.  
- [Runtime-container](Runtime-container) - This is again an Ubuntu container which runs a `HelloWorld` executable i.e C or C++ source code inside the docker container.  
   This example specifies how to use runtime container to get rid of all the source files that we copy present in the container for building the executable and only provide the executable in the final docker container image.  
   See https://docs.docker.com/develop/develop-images/multistage-build/ for additionalo content.

## General Information about Docker Containers    
 - Each instruction in `Dockerfile` creates a layer.
 - `--build-arg` is used to pass variable values inside Dockerfile. This is used in various `build-docker.sh` scripts and also in `Dockerfile` in this repository. This limits the docker container to fail in case no variable value is passed.   
 - `-f` option in `docker build` is used to change the name of `Dockerfile` to any arbirtary filename. By default, the `docker build` command would look for the docker file named `Dockerfile` in the directory specified as an argument in the `docker build` command. The `build-script.sh` uses `.` signifying current working directory.  
 - All the src files that needs to be added in the docker conatainer should be present in the same directory as `Dockerfile` or in a sub-directory of the directory containing `Dockerfile`. Any commands used such as `COPY` OR `ADD` won't work for the source files if they are placed atleast one directory up from the directory consisting the `Dockerfile`.  
 - Best Practice for sending the minimum build-context in Docker:  
    See: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/    
 - `privileged` gives root access of the host to the docker container. It automatically passess all the device nodes i.e `/dev` and `/proc`, `/sys` partitions.  
 - Labels - https://medium.com/@chamilad/lets-make-your-docker-image-better-than-90-of-existing-ones-8b1e5de950d   
   
  
## Recommendations  
- Create Ephemeral Containers  
- Minimize build context  
- Use .dockerignore  
- Use multi-stage builds  
- Don't install unnecessary packages  
- Decouple applications  
- Minimize number of layers 
- Minimize each layer size 
- Sort multi-line arguments  
- Leverage build cache   
- Use `--no-install-recommends` to reduce the size of the image. Sometimes `--no-install-recommends` can lead to missing libraries/packages required. See https://ubuntu.com/blog/we-reduced-our-docker-images-by-60-with-no-install-recommends   
- Use rm -rf /var/lib/apt/lists* at the end of the `RUN apt-get update ...` command to clean up temporary install files. See https://askubuntu.com/a/1038255.  
   Official Debian and Ubuntu images automatically run apt-get clean, so explicit invocation is not required. 
   Needed only in the last stage of multi-stage builds since the earlier ones would be lost as intermediate containers. See https://pythonspeed.com/articles/system-packages-docker/  


## Dockerfile Mistakes  
- https://runnable.com/blog/9-common-dockerfile-mistakes  
