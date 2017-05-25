# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define :rdasparkhandson do |rdasparkhandson_config|
	  # Every Vagrant virtual environment requires a box to build off of.
	  rdasparkhandson_config.vm.box = "ubuntu/xenial64"

	  # required by couchbase-cli
	  rdasparkhandson_config.ssh.shell = "export LC_ALL=\"en_US.UTF-8\""
	  rdasparkhandson_config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
	  rdasparkhandson_config.ssh.username = "ubuntu"
      rdasparkhandson_config.vm.provision "shell", inline: <<-SHELL
          echo "ubuntu:ubuntu" | sudo chpasswd
      SHELL
	  rdasparkhandson_config.vm.provision :shell, :path => "install_puppet.sh"
	  rdasparkhandson_config.vm.provision "puppet" do |puppet|
	    puppet.module_path = "puppet/modules"
	    puppet.manifests_path = "puppet/manifests"
	    puppet.manifest_file = "."
	    puppet.options = "--environment dev"
	  end


 	  rdasparkhandson_config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
	    v.customize ["modifyvm", :id, "--memory", "2048"]
	  end

	  rdasparkhandson_config.vm.network :private_network, ip: "192.168.56.101"
	  rdasparkhandson_config.vm.network "forwarded_port", guest: 8888, host: 8888


   end
end

