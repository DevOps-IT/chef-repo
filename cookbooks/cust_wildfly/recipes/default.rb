# encoding: UTF-8
#
# Cookbook Name:: wildfly
# Recipe:: default
#
# Copyright (C) 2014 Brian Dwyer - Intelligent Digital Services
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'cust_wildfly::install'
include_recipe 'cust_wildfly::mysql_connector' if node['wildfly']['mysql']['enabled']
include_recipe 'cust_wildfly::postgres_connector' if node['wildfly']['postgresql']['enabled']
