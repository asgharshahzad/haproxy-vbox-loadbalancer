# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.require_version ">= 2.2.4"

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.box_check_update = false

    config.vm.define :proxy do |proxy|
      proxy.vm.provider :virtualbox do |vb|
        vb.name = "proxy"
      end
      proxy.vm.hostname = "proxy"
      proxy.vm.network "private_network", ip: "192.168.0.100"
      proxy.vm.provision :shell, path: "proxy_bootstrap.sh"
    end

    config.vm.define :web1 do |web1|
      web1.vm.provider :virtualbox do |vb|
        vb.name = "web1"
      end
      web1.vm.hostname = "web1"
      web1.vm.network "private_network", ip: "192.168.0.101"
      web1.vm.provision :shell, path: "web1_bootstrap.sh"
    end

    config.vm.define :web2 do |web2|
      web2.vm.provider :virtualbox do |vb|
        vb.name = "web2"
      end
      web2.vm.hostname = "web2"
      web2.vm.network "private_network", ip: "192.168.0.102"
      web2.vm.provision :shell, path: "web2_bootstrap.sh"
    end
end