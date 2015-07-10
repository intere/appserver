require 'spec_helper'

describe 'appserver::default' do
  context 'configuration overrides' do
    let(:chef_run) {
      stub_command("npm -v 2>&1 | grep '1.1.0-3'").and_return(true)
      stub_command("/usr/sbin/apache2 -t").and_return(true)
      ChefSpec::SoloRunner.converge(described_recipe)
    }

    it 'does include appserver::grunt_build' do
      expect(chef_run).to include_recipe('appserver::grunt_build')
    end

    it 'does include appserver::jenkins' do
      expect(chef_run).to include_recipe('appserver::jenkins')
    end

    it 'does include appserver::apache' do
      expect(chef_run).to include_recipe('appserver::apache')
    end

    it 'does include appserver::tomcat' do
      expect(chef_run).to include_recipe('appserver::tomcat')
    end

    it 'does include appserver::mongo' do
      expect(chef_run).to include_recipe('appserver::mongo')
    end

    it 'does include maven::default' do
      expect(chef_run).to include_recipe('maven::default')
    end

    it 'does override jenkins port to be 8081' do
      expect(chef_run.node['jenkins']['master']['port']).to eq 8081
    end

    it 'does override jenkins arguments to set a prefix of /jenkins' do
      expect(chef_run.node['jenkins']['master']['jenkins_args']).to eq '--prefix=/jenkins'
    end

    it 'does override the version of java' do
      expect(chef_run.node['java']['install_flavor']).to eq 'oracle'
      expect(chef_run.node['java']['jdk_version']).to eq '7'
      expect(chef_run.node['java']['oracle']['accept_oracle_download_terms']).to be_truthy

    end


    # it 'does set the jenkins port to be 8081' do
    #   expect(chef_run.node['jenkins']['master']['port']).to eq 8081
    #   expect(chef_run.node['jenkins']['master']['jenkins_args']).to eq '--prefix=/jenkins'
    # end
  end

end
