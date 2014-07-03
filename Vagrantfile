# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "internet-explorer"
  config.vm.box = "windows_2008_r2"

  config.vm.communicator = "winrm"
 
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048, "--cpus", 2]
  end

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = { ie: { version: 10 } }

    chef.run_list = [
        "recipe[internet-explorer]",
        "recipe[internet-explorer::disable_first_run_customize]",
        "recipe[internet-explorer::disable_esc]",
        "recipe[internet-explorer::disable_auto_update]",
        "recipe[windows::reboot_handler]",
    ]
  end
end
