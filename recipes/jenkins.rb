#
# Sets up / configures Jenkins
#

include_recipe "jenkins::master"

package "git" do
  action :install
end


execute "allow jenkins shell access" do
  command "mkdir /home/jenkins"
  command "chown jenkins:jenkins /home/jenkins"
  command "ps -aef|grep -i jenkins|awk '{print $2}'|xargs kill -9"
  command "usermod --home /home/jenkins --shell /bin/bash jenkins"
  action :run
end
