require_relative '../spec_helper'

describe 'appserver::default' do
  # Use an explicit subject
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  context 'Configuration' do
    it 'does override the version of java' do
      expect(chef_run.node['java']['install_flavor']).to eq 'oracle'
      expect(chef_run.node['java']['jdk_version']).to eq '7'
      expect(chef_run.node['java']['oracle']['accept_oracle_download_terms']).to be_truthy
    end

    it 'does set the tomcat version to 7' do
      expect(chef_run.node['tomcat']['base_version']).to eq 7
    end

    it 'does set the jenkins port to run on port 8081' do
      expect(chef_run.node['jenkins']['master']['port']).to eq 8081
    end
  end

  context 'Install Packages' do
    it 'does install git' do
      expect(chef_run).to install_package('git')
    end
  end


  it 'does include java' do
    expect(chef_run).to include_recipe('java')
  end

  it 'does include tomcat' do
    expect(chef_run).to include_recipe('tomcat')
  end

  it 'does include jenkins' do
    expect(chef_run).to include_recipe('jenkins::master')
  end

end
