#
# Cookbook Name:: proj1
# Recipe:: clean
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
#
include_recipe 'env_base'

	wildfly_home = "/opt/#{node['proj1']['wildfly_version']}"
	
	execute 'clean deployment wars' do
		command "rm -rf #{wildfly_home}/standalone/deployments/*.war*"
		action :run
	end

	execute 'clean .deployed files' do
    	command "rm -rf #{wildfly_home}/standalone/deployments/*.deployed*"
    	action :run
  	end

	execute 'clean tmp' do
		command "rm -rf #{wildfly_home}/standalone/tmp/*"
		action :run
  	end

	execute 'clean data' do
		command "rm -rf #{wildfly_home}/standalone/data/*"
		action :run
	end