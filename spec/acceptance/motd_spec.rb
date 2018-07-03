require 'spec_helper_acceptance'
 
describe 'puppet_practice_m::motd apply module twice' do
    let(:manifest) {
        <<-EOF
            include 'puppet_practice_m'
        EOF
    }
 
    it 'apply first time' do
        start = Time.now
        result = apply_manifest(manifest, catch_failures: true)
        finish = Time.now
        elapsed = finish - start
        puts "Initial application of base module took #{elapsed} seconds on #{result.host}."
        expect(@result.exit_code).to eq 2
    end
 
    it 'apply second time' do
        start = Time.now
        result = apply_manifest(manifest, catch_failures: true)
        finish = Time.now
        elapsed = finish - start
        puts "Second application of base module took #{elapsed} seconds on #{result.host}."
        expect(@result.exit_code).to eq 2
        expect(elapsed).to be < 20
    end
end
 
describe file('/etc/motd') do
    it { should exist }
    it { should be_file }
    its(:content) { should eq "hello, world!\n" }
end
 
describe file("/tmp/hiera_test.txt") do
    it { should exist }
    it { should be_file }
    its(:content) { should eq "119 C Street Petaluma, Ca 94952" }
end
 
describe file("/tmp/facter_test.txt") do
    it { should exist }
    it { should be_file }
    its(:content) { should eq "Petaluma Office Rules!" }
end 
