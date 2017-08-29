#
# Cookbook:: gravitee
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'yum-epel::default'
include_recipe 'java::default'
include_recipe 'sc-mongodb::default'
include_recipe 'elasticsearch::default'

poise_archive 'gravitee.zip' do
  path node['gravitee']['api_manager']
  destination node['gravitee']['install_path']
  not_if { ::Dir.exist?(File.join(node['gravitee']['install_path'], "graviteeio-gateway-#{node['gravitee']['version']}")) }
end

include_recipe 'gravitee::gateway'
include_recipe 'gravitee::managerapi'
include_recipe 'gravitee::managerui'
