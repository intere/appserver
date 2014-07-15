#
# Cookbook Name:: appserver
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "appserver::apache"
include_recipe "appserver::tomcat"

include_recipe "mongodb::default"
include_recipe "jenkins::master"
include_recipe "maven::default"

package "git" do
  action :install
end


# jenkins_plugin 'git'


execute "service iptables stop"

# include_recipe "appserver::nzbperl"
