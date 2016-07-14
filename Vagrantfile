Vagrant.configure("2") do |config|

  config.vm.define :stargate do |machine|
    machine.vm.box = "centos_6_guest_additions"
    machine.vm.hostname = "stargate"
    machine.vm.network "private_network", ip: "192.168.33.101"
    machine.vm.provision "shell", path: "install_scripts/server.sh"
  end

  config.vm.define :sg1 do |machine|
    machine.vm.box = "centos_6_guest_additions"
    machine.vm.hostname = "sg1"
    machine.vm.network "private_network", ip: "192.168.33.102"
    machine.vm.provision "shell", path: "install_scripts/client.sh"
  end

end
