#
# Sets up Mongo
#

include_recipe "mongodb::default"

if File.exists?('/vagrant/apps/mongo/dump')
  execute "Import Mongo Data" do
    command "mongorestore /vagrant/apps/mongo/dump"
    action :run
  end
end
