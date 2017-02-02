# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.synced_folder ".", "/vagrant"

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    config.vbguest.no_install = true
    config.vbguest.no_remote = true
  end
  (1..4).each do |machine_id|
    config.vm.define "cluster0#{machine_id}" do |c|
      c.vm.box = "bento/ubuntu-16.04"
      c.vm.hostname = "cluster0#{machine_id}"
      c.vm.network "private_network", ip: "10.100.100.10#{machine_id}"
      c.vm.provision "shell" do |s|
        s.env = { 'DEBIAN_FRONTEND' => 'noninteractive'}
        s.path = "scripts/bootstrap_python.sh"
      end
      c.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.customize ["modifyvm", :id, "--cableconnected1", "on"]
      end
    end
  end

  config.vm.define "control" do |c|
    c.vm.box = "bento/ubuntu-16.04"
    c.vm.hostname = "control"
    c.vm.network "private_network", ip: "10.100.100.100"

    c.vm.provision "shell" do |s|
      s.env = { 'DEBIAN_FRONTEND' => 'noninteractive'}
      s.path = "scripts/bootstrap_ansible.sh"
    end
    c.vm.provider "virtualbox" do |v|
      v.memory = "1024"
      v.customize ["modifyvm", :id, "--cableconnected1", "on"]
    end
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "cluster.yml"
  end
end
