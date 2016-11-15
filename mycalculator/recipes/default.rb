#
# Cookbook Name:: mycalculator
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'nodejs'

package 'git' do
	action :install
end

directory node['mycalculator']['repo_dir'] do
	action :create
end

git node['mycalculator']['repo_dir'] do
	repository node['mycalculator']['repo_url']
end

template "#{node['mycalculator']['repo_dir']}/#{node['mycalculator']['package_file_name']}" do
        source "#{node['mycalculator']['package_file_name']}.erb"
	action :create
end
