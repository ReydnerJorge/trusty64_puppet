  Vagrant.configure("2") do |config|

    # informando ao Vagrant qual a Imagem e a versão do Ubuntu
    config.vm.box = "ubuntu/trusty64"
    config.vm.box_version = "20191107.0.0"

    # configurando a VM de aplicação
    config.vm.define:app do |app_config|
      app_config.vm.network "private_network", ip: "192.168.50.10"
      # instalando o Puppet na VM
      app_config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install -y puppet"
      # informando ao Vagrant para prosseguir com o provisionamento utilizando o Puppet
      app_config.vm.provision "puppet" do |puppet|
        puppet.manifest_file = "app.pp"
      end

      # utilizando o VirtualBox como provider
      app_config.vm.provider:virtualbox do |v|
        v.memory = 1024
        v.cpus = 1
      end
    end
end