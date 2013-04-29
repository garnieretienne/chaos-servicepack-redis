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
