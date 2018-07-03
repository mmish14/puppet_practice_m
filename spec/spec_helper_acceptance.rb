require 'beaker-rspec'
 
RSpec.configure do |c|
    c.formatter = :documentation
 
    c.before :suite do
        # Install module to all hosts
        hosts.each do |host|
            copy_module_to(host, module_name: 'puppet_practice_m', target_module_path: '/etc/puppet/modules', source: './')
        end
    end
end
