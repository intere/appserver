#
# Cookbook Name:: appserver
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "appserver::grunt_build"
include_recipe "appserver::jenkins"
include_recipe "appserver::apache"
include_recipe "appserver::tomcat"
include_recipe "appserver::mongo"

include_recipe "maven::default"


execute "service iptables stop"

# include_recipe "appserver::nzbperl"
