#
# Sets up / configures Jenkins
#

include_recipe "jenkins::master"

package "git" do
  action :install
end

package "redis" do
  action :install
end

execute "allow jenkins shell access" do
  command "mkdir /home/jenkins"
  command "chown jenkins:jenkins /home/jenkins"
  command "ps -aef|grep -i jenkins|awk '{print $2}'|xargs kill -9"
  command "usermod --home /home/jenkins --shell /bin/bash jenkins"
  action :run
end

execute "/usr/bin/git clone git@github.com:intere/hubot.git" do
  cwd '/home/jenkins'
  user 'jenkins'
  not_if { ::File.exists?('/home/jenkins/hubot') }
end

execute "/usr/bin/git checkout vagrant" do
  cwd '/home/jenkins/hubot'
  user 'jenkins'
end

execute "/usr/local/bin/npm install -g hubot coffee-script hubot-irc"
execute "/home/jenkins/hubot/hubot.sh"
