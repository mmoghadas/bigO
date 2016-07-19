require 'spec_helper'

describe 'ntp' do
  it do
    is_expected.to contain_class('ntp')
  end

  it do
    is_expected.to contain_package('ntp').with_ensure('latest')
  end

  it do
    is_expected.to contain_package('ntpdate').with_ensure('installed')
  end

  it do
    is_expected.to contain_file('ntp_config').with(
      'ensure' => 'present',
      'path' => '/etc/ntp.conf',
      'group' => 'root',
      'owner' => 'root',
      'mode' => '0644',
      'require' => 'Package[ntp]'
    ).with_content(/# STARGATE IS MY MASTER!!!/)
  end

  it do
    is_expected.to contain_service('ntpd').with(
      'ensure' => 'running',
      'hasstatus' => 'true',
      'hasrestart' => 'true',
      'enable' => 'true',
      'require' => 'File[ntp_config]'
    )
  end
end
