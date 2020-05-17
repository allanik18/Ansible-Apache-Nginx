Vagrant.configure("2") do |config|
  config.vm.define "ubuntu-00" do |ubuntu|
    ubuntu.vm.box = "ubuntu/bionic64"
    ubuntu.vm.hostname = 'ubuntu-00'
    ubuntu.vm.box_url = "ubuntu/bionic64"
    ubuntu.vm.network "private_network", ip: "10.10.0.4"
    config.vm.provision :shell, :path => "env/set_ubuntu.sh"
    ubuntu.vm.network :forwarded_port, guest: 22, host: 10400, id: "ssh"
    config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/", rsync__auto: true
    ubuntu.vm.provider :virtualbox do |v|
      v.cpus = 2
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 3000]
      v.customize ["modifyvm", :id, "--name", "ubuntu-00"]
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.define "centos-00" do |centos|
    centos.vm.box = "centos/7"
    centos.vm.hostname = 'centos-00'
    centos.vm.box_url = "centos/7"
    centos.vm.network "private_network", ip: "10.10.0.2"
    config.vm.provision :shell, :path => "env/set_centos.sh"
    centos.vm.network :forwarded_port, guest: 22, host: 10404, id: "ssh"
    config.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/", rsync__auto: true
    centos.vm.provider :virtualbox do |v|
      v.cpus = 2
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 3000]
      v.customize ["modifyvm", :id, "--name", "centos-00"]
    end
  end
end