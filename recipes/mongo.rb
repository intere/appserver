#
# Sets up Mongo
#

include_recipe "mongodb::default"

#
# Import data if it exists
#
if File.exists?('/vagrant/apps/mongo/dump')
  execute "Import Mongo Data" do
    command "mongorestore /vagrant/apps/mongo/dump"
    action :run
  end
end
