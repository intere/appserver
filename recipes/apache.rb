#
# Configures / Sets up Apache
#

include_recipe "apache2"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_proxy"

package "mod_ssl" do
  action :install
end

apache_site "default" do
  enable false
end

execute "change permission web" do
  command "chmod -R 0777 /vagrant/web"
  action :run
end

web_app 'insecure' do
  server_name node['hostname']
  template 'apache_insecure_conf.erb'
end

execute "/usr/bin/openssl genrsa -out server.key 2048" do
  cwd '/etc/httpd/ssl'
  not_if { ::File.exists?('/etc/httpd/ssl/server.key') }
end

execute "/usr/bin/openssl req -new -x509 -key server.key -out server.crt -days 1095 -batch" do
  cwd '/etc/httpd/ssl'
  not_if { ::File.exists?('/etc/httpd/ssl/server.crt') }
end

web_app 'secure' do
  server_name node['hostname']
  template 'apache_secure_conf.erb'
end

execute "/usr/sbin/a2enmod proxy_http"