#
# Cookbook:: gravitee
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'java::default'
include_recipe 'sc-mongodb::default'
include_recipe 'elasticsearch::default'

poise_archive 'gravitee.zip' do
  path node['gravitee']['api_manager']
  destination node['gravitee']['install_path']
  not_if { ::Dir.exist?(File.join(node['gravitee']['install_path'], "graviteeio-gateway-#{node['gravitee']['version']}")) }
end

link File.join(node['gravitee']['install_path'], 'graviteeio-gateway') do
  to File.join(node['gravitee']['install_path'], "graviteeio-gateway-#{node['gravitee']['version']}")
  link_type :symbolic
end

systemd_unit 'gravitee.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Run Gravitee Service

  [Service]
  Type=forking
  PIDFile=/var/run/gio.pid
  ExecStart=#{File.join(node['gravitee']['install_path'], 'graviteeio-gateway', 'bin', 'gravitee')} -d -p=/var/run/gio.pid
  ExecStop=kill `cat /var/run/gio.pid`

  [Install]
  WantedBy=multi-user.target
  EOU

  action [:create, :enable, :start]
end
