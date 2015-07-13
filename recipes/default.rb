#
# Cookbook Name:: appserver
# Recipe:: default
#
# Copyright 2015, iColasoft
#
# All rights reserved - Do Not Redistribute
#

# Install Git
package "git" do
  action :install
end

# Install Java, Tomcat and Jenkins
include_recipe 'java'
include_recipe 'maven'
include_recipe 'tomcat'
include_recipe "jenkins::master"
