# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :bridged, :bridge => 'en1: Wi-Fi (AirPort)'
  config.vm.forward_port 80, 8080
  config.vm.forward_port 3000, 3000

  config.vm.provision :puppet do |puppet|
    puppet.working_directory = "/tmp/vagrant-puppet/manifests"
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.manifest_file  = "base.pp"
  end
end
