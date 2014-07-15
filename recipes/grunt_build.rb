#
#
#

include_recipe 'npm::default'

npm_package "grunt-cli" do
  action :install
end

npm_package "bower" do
  action :install
end

gem_package "sass" do
  action :install
end
