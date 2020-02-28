#!/bin/bash
echo "**** Begin downloading minikube"

#Download a static binary
curl -Lso minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube

#Add the Minikube executable to your path
sudo cp minikube /usr/local/bin/
rm minikube

echo "**** End downloading minikube"

echo "**** Begin starting a Cluster"

#Start a Cluster
minikube start --vm-driver=none

echo "**** End starting a Cluster"