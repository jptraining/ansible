# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the ne documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"
  config.vm.define "centos1" do |centos1|
      centos1.vm.hostname = "centos1"
      centos1.vm.network :private_network, ip: "192.168.100.100" 
      centos1.vm.network "forwarded_port", guest: 8001, host: 8001
#      centos1.vm.synced_folder "c:/dev", "/vagrant"
  end
  config.vm.define "centos2" do |centos2|
      centos2.vm.hostname = "centos2"
      centos2.vm.network :private_network, ip: "192.168.100.110"
  end

  config.vm.define "centos3" do |centos3|
      centos3.vm.hostname = "centos3"
      centos3.vm.network :private_network, ip: "192.168.100.120"
  end

  config.vm.box = "ubuntu/trusty64"
  config.vm.define "ubuntu2" do |ubuntu2|
      ubuntu2.vm.hostname = "ubuntu2"
      ubuntu2.vm.network :private_network, ip: "192.168.100.200"
  end

  config.vm.define "ubuntu1" do |ubuntu1|
      ubuntu1.vm.hostname = "ubuntu1"
      ubuntu1.vm.network :private_network, ip: "192.168.100.210"
  end

	config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
#      echo "ubuntu:ubuntu" | sudo chpasswd      
      systemctl restart sshd
	SHELL

   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
      vb.gui = true
      vb.customize ["modifyvm", :id, "--memory", 1948]
#      Customize the amount of memory on the VM:
     vb.memory = "1948"
   end

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
#  config.vm.synced_folder "../", "/home/vagrant/dev"
end
