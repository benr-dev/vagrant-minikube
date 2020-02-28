# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.define "ubuntu_minikube" do |ubuntu_minikube|
    
    config.vm.network "forwarded_port",
      guest: 8001,
      host:  8001,
      auto_correct: true
    
    config.vm.provider "virtualbox" do |vb|
      vb.name = "Ubuntu Minikube"
      vb.memory = "4096"
      # 2 CPUs currently required for minikube 
      vb.cpus = "2"
    end

    args = []
    config.vm.provision "shell",
      path: "scripts/install-docker.sh", 
      args: args
    
    # This installer needs to run before kubectl
    args = []
    config.vm.provision "shell", 
      path: "scripts/install-minikube.sh", 
      args: args
    
    args = []
    config.vm.provision "shell", 
      path: "scripts/install-kubectl.sh", 
      args: args
  
    args = []
    config.vm.provision "shell", 
        path: "scripts/install-k8dashboard.sh", 
        args: args
            
  end

end
