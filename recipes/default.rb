#
# Cookbook Name:: consul-vault
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
#

include_recipe 'selinux::permissive'
#include_recipe 'consul-vault::consul_user'
include_recipe 'consul-vault::consul'


