#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2013, Etienne Garnier
#
# All rights reserved - Do Not Redistribute
#

# Install Redis package
package "redis server" do
  package_name "redis-server"
  action :upgrade
end

# Ensure the service is running
service "redis" do
  service_name "redis-server"
  action :enable
end

# Generate redis configuration file
template "redis conf" do
  path "/etc/redis/redis.conf"
  source "redis.conf.erb"
  owner "root"
  group "root"
  mode 0600
  notifies :reload, 'service[redis]', :immediately
end