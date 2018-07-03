# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
   config.vm.box = "centos/7"
   config.vm.synced_folder ".", "/etc/puppet/modules/josh_reed_tutorial_m", create: true, type: "rsync", rsync__exclude: [".vagrant/", ".git/"]
 
   config.vm.provision "shell", inline: <<-SHELL
     echo "Installing dependencies..."
     sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
     sudo yum -y install puppet
   SHELL
end
