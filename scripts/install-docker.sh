#!/bin/bash
echo "**** Begin installing Docker CE"

#Uninstall old versions
sudo apt remove docker docker-engine docker.io containerd runc

#Set up the repository
##Update the apt package index
sudo apt update

##Install packages to allow apt to use a repository over HTTPS
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

##Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

##Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#Install Docker CE
##Update the apt package index
sudo apt update

#Install latest Docker CE
sudo apt install -y docker-ce docker-ce-cli containerd.io

#Install a specific version of Docker CE 
#sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu

#Verify that Docker CE is installed correctly by running the hello-world image
sudo docker run hello-world

#use Docker as a non-root user
usermod -aG docker vagrant

echo "**** End installing Docker CE"