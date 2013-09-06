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
  variables({
    :app_name => node[:deploy][:application],
    :serve_port => node[:nginx][:serve_port],
    :root_dir => node[:deploy][:deploy_to],
    :log_dir => node[:nginx][:log_dir],
    })
end

link "/etc/nginx/sites-enabled/application" do
  to "/etc/nginx/sites-available/application"
end

service "nginx" do
  action[:enable,:start]
end