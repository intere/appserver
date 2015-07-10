
# Let's have Jenkins run on port 8081
default['jenkins']['master']['port'] = 8081
default['jenkins']['master']['jenkins_args'] = '--prefix=/jenkins'

# Let's use Oracle JDK 7
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = '7'
default['java']['oracle']['accept_oracle_download_terms'] = true
