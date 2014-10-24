require 'spec_helper'

describe 'common' do
  # check os version
  describe file('/etc/redhat-release') do
    it { should contain 'CentOS Linux release 7.0' }
  end

  # check hostname
  describe file('/etc/sysconfig/network') do
    it { should contain '#{property[:host_name]}' }
  end

  # check packages
  describe_packages[
    "rsync",
    "unzip",
    "telnet",
    "git"
  ]
end
