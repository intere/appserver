# Let's use Oracle JDK 7
node.default['java']['install_flavor'] = 'oracle'
node.default['java']['jdk_version'] = '7'
node.default['java']['oracle']['accept_oracle_download_terms'] = true

# Set tomcat version to 7
# node.default["tomcat"]["base_version"] = 7

# Let's configure Jenkins to run on port 8081
node.default['jenkins']['master']['port'] = 8081
