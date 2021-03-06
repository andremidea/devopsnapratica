# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise32"
  config.librarian_puppet.puppetfile_dir = "librarian"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.define :db do |db_config|
    db_config.vm.network :private_network, :ip => "192.168.33.10"
    db_config.vm.provision "puppet" do |puppet|
       puppet.module_path = ["modules", "librarian/modules"]
       puppet.manifest_file = "db.pp"
    end
  end

  config.vm.define :web do |db_config|
    db_config.vm.network :private_network, :ip => "192.168.33.12"
    db_config.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules", "librarian/modules"]
       puppet.manifest_file = "web.pp"
    end
  end

  config.vm.define :monitor do |db_config|
    db_config.vm.network :private_network, :ip => "192.168.33.14"
  end

   config.vm.define :ci do |build_config|
    build_config.vm.network :private_network, :ip => "192.168.33.16"
    build_config.vm.provision "puppet" do |puppet|
      puppet.module_path = ["modules", "librarian/modules"]
      puppet.manifest_file = "ci.pp"
    end
  end
end
