#!/bin/bash
echo "**** Begin installing kubectl"

#Install kubectl binary
sudo apt update && sudo apt install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl

#Check the kubectl configuration
kubectl cluster-info

#Make kubectl work for your non-root user named vagrant
mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config

echo "**** End installing kubectl"

echo "**** Begin preparing dashboard"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml
# Proxy port 8001 allowing local dashboard access
# http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
echo "To use dashboard: vagrant ssh kubectl proxy --address='0.0.0.0' --port=8001"
echo "**** End preparing dashboard"