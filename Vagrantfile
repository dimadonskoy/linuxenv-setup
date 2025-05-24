####### UBUNTU ARM64 FOR DEVOPS########
Vagrant.configure("2") do |config|

  config.vm.define "ubuntu24_vm1" do |vm1|
    vm1.vm.box = "net9/ubuntu-24.04-arm64"
    vm1.vm.hostname = "ubuntu-devops"
    vm1.vm.network "private_network", ip: "192.168.1.100"
    vm1.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
      vb.cpus = 1
    end
      config.vm.provision "shell", path: "global_env_config.sh"
      config.vm.provision "shell", path: "user_env_config.sh"
  end
end