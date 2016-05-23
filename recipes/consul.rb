#
# Cookbook Name:: consul-vault
# Recipe:: consul
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#

# Install some useful packages
package "unzip" do
  action :install
end

# Pull down the consul binary
remote_file '/tmp/consul_0.6.4_linux_amd64.zip' do
  source 'http://192.168.1.76/centos/dev-software/consul_0.6.4_linux_amd64.zip'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# Extract zip
execute 'unzip_consul' do
  command 'unzip /tmp/consul_0.6.4_linux_amd64.zip'
  cwd '/usr/local/bin/'
  not_if { File.exists?("/usr/local/bin/consul") }
end

# Setup the consul user
group node['consul-vault']['group']

user node['consul-vault']['user'] do
  group node['consul-vault']['group']
  system true
  shell '/bin/bash'
end

