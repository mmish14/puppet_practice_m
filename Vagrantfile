# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
   config.vm.box = "centos/7"
   config.vm.synced_folder ".", "/etc/puppet/modules/josh_reed_tutorial_m", create: true, type: "rsync", rsync__exclude: [".vagrant/", ".git/"]
   config.vm.synced_folder "./spec/fixtures/hieradata", "/etc/puppet/hieradata", type: "rsync", rsync__exclude: [".vagrant/", ".git/"]

# Have to copy the files to a tmp folder becuase of permission issues, as this command uses scp
   config.vm.provision "file", source: "./spec/default_facts.yml", destination: "/tmp/default_facts.yaml"
   config.vm.provision "file", source: "./spec/fixtures/hiera.yaml", destination: "/tmp/hiera.yaml"

# Install puppet 3.8.7
   # Make sure hiera.yaml is available in both places that hiera looks for it.
   config.vm.provision "shell", inline: <<-SHELL
    echo "installing puppet..."
    sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
    sudo yum -y install puppet
    echo "setting up hiera and facter..."
    sudo cp /tmp/hiera.yaml /etc/puppet/hiera.yaml
    sudo cp /tmp/hiera.yaml /etc/hiera.yaml
    sudo mkdir -p /etc/facter/facts.d
    sudo cp /tmp/default_facts.yaml /etc/facter/facts.d/default_facts.yaml
    echo "cleaning up..."
    sudo rm /tmp/default_facts.yaml
    sudo rm /tmp/hiera.yaml
   SHELL
end 
