# Cookbook to install Redis stack using the package manager.

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