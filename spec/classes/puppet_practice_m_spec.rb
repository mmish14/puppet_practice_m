require 'spec_helper'
describe 'puppet_practice_m' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      it { is_expected.to compile }
      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('puppet_practice_m::motd') }
      it { is_expected.to contain_notify('applying hello world to the message of the day') }
    end
  end
end
