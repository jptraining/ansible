# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  servers=[    
    {
      :hostname => "centos1",
      :ip => "192.168.100.110",
      :box => "centos/7",
      :ram => 1024
    },
    {
      :hostname => "controller",
      :ip => "192.168.100.100",
      :box => "centos/7",
      :ram => 2048,
      :controller => true
    }	
  ]
  
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the ne documentation at
  # https://docs.vagrantup.com.

  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
        node.vm.box = machine[:box]
        node.vm.hostname = machine[:hostname]
        node.vm.network "private_network", ip: machine[:ip]
        node.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
        end
	# Run Ansible playbook on the master host
        if (!machine[:controller].nil?)
			$ansible_installation_script = <<-SCRIPT
			yum update -y
			yum upgrade -y
			yum install epel-release -y
			yum install ansible -y
			SCRIPT

			node.vm.provision "shell", inline: $ansible_installation_script
        end
		$enable_password_authentication = <<-SCRIPT
		sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
		#echo "ubuntu:ubuntu" | sudo chpasswd      
		systemctl restart sshd		
		SCRIPT
		config.vm.provision "shell", inline: $enable_password_authentication  		
    end
  end
end