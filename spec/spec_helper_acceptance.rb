require 'beaker-rspec'
require 'beaker-hiera'
 
RSpec.configure do |c|
    c.formatter = :documentation
 
    c.before :suite do
        # Install module to all hosts
        hosts.each do |host|
            # Setup puppet module
            copy_module_to(host, module_name: 'puppet_practice_m', target_module_path: '/etc/puppet/modules', source: './')
 
            # Setup Hiera
            on(host, 'sudo mkdir -p /etc/puppet/hieradata')
            write_hiera_config_on(host, ['default'])            
            copy_hiera_data_to(host, './spec/fixtures/hieradata/default.yaml')
 
            # Setup Facter
            on(host, 'sudo mkdir -p /etc/facter/facts.d')
            scp_to(host, "./spec/default_facts.yml", "/tmp/default_facts.yaml")
            on(host, 'sudo cp /tmp/default_facts.yaml /etc/facter/facts.d/default_facts.yaml')
        end
    end
end
