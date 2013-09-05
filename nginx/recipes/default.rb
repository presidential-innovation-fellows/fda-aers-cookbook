#
# Cookbook Name:: nginx
# Recipe:: default
#
#

package "nginx" do
  action [:install]
end

template "/etc/nginx/sites-available/application" do
  source "application.erb"
end

link "/etc/nginx/sites-enabled/application" do
  to "/etc/nginx/sites-available/application"
end

service "nginx" do
  action[:enable,:start]
end