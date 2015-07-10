require 'spec_helper'

describe 'appserver::jenkins' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  before do
    stub_command("mkdir /home/jenkins").and_return(true)
    stub_command("chown jenkins:jenkins /home/jenkins").and_return(true)
    stub_command("ps -aef|grep -i jenkins|awk '{print $2}'|xargs kill -9").and_return(true)
    stub_command("usermod --home /home/jenkins --shell /bin/bash jenkins").and_return(true)
  end

  it 'does include jenkins::master' do
    expect(chef_run).to include_recipe 'jenkins::master'
  end

  it 'does add the git package' do
    expect(chef_run).to install_package('git')
  end

  it 'does add the redis package' do
    expect(chef_run).to install_package('redis')
  end

  
end
