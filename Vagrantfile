# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # server or desktop
  #config.vm.box = "ubuntu/xenial64"
  config.vm.box = "fso/xenial64-desktop"
	
  # set default ip
  config.vm.network "private_network", ip: "10.10.15.10"

  # set hostname
  config.vm.hostname = "xcurrency-controller"	
	
  # tweak virtualbox
  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]    
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", 2]
  end	

  # adapt the script or add multiple calls
  config.vm.provision :shell, :path => "vagrant_provision.sh", privileged: true
  # provisioning
	
end
