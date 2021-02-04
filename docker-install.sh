#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

# Remove Older Versions
sudo apt-get remove docker docker-engine docker.io

# Install the latest Version
#sudo snap install docker     # version 19.03.11, or
sudo apt install docker.io -y # version 19.03.8-0ubuntu1.20.04.2

echo "*****************************"
echo "Follow the steps in the link below if you get a PERMISSION DENIED error on building docker container"
echo "https://docs.docker.com/engine/install/linux-postinstall/"
