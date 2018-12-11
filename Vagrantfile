# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  servers=[
    {
      :hostname => "controller",
      :ip => "192.168.100.100",
      :box => "centos/7",
      :ram => 1024,
      :controller => true
    },    
    {
      :hostname => "centos1",
      :ip => "192.168.100.110",
      :box => "centos/7",
      :ram => 1024
    },
    {
      :hostname => "centos2",
      :ip => "192.168.100.120",
      :box => "centos/7",
      :ram => 1024
    },
    {
      :hostname => "ubuntu1",
      :ip => "192.168.100.130",
      :box => "bento/ubuntu-18.10",
      :ram => 1024
    }
  ]
  
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the ne documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"
  
  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
        node.vm.box = machine[:box]
        node.vm.hostname = machine[:hostname]
        node.vm.network "private_network", ip: machine[:ip]
        node.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
        end
        if (!machine[:controller].nil?)
          node.vm.provision "ansible_local" do |ansible|
            ansible.playbook = "provision/playbook.yml"
            ansible.verbose = false
            ansible.limit          = "all"        
            ansible.inventory_path = "provision/inventory"
          end
        end        
    end
  end

	config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
#      echo "ubuntu:ubuntu" | sudo chpasswd      
      systemctl restart sshd
	SHELL
end