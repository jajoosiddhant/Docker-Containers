# Runtime-container  
  
Example to build a simple Ubuntu Container using Runtime-container with the desired version specified in `container.conf`.   
Any number of Runtime-containers can be created.  
Runtime containers have the advantage to reduce the final size of the docker container to share.  
Since, it removes the source file as well as any packages such as `cmake` and `build-essential` that are only required to build the executable and not required while running the executable.  
In this example, we got rid of both the packages `cmake` and `build-essential` in the final docker container image using `runtime-container`.    
The `HelloWorld` example compiled here was a `.cpp` file.  
In this example, the runtime container image was the same as base-image though they can be different as well. There can be more than two runtime containers as well in a Dockerfile if needed.
  
All the files to be copied/added in the container can be placed in the `build-context` directory.  
Edit the `Dockerfile` as required.  
This directory can be used as is on any Linux Machine to build the docker container.