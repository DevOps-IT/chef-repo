#
# Cookbook Name:: env_base
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
chef_gem 'httpclient' do
  compile_time true
end

include_recipe "git"
include_recipe "env_base::java"
include_recipe "wildfly"
