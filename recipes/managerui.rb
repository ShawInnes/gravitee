
link File.join(node['gravitee']['install_path'], 'graviteeio-management-ui') do
  to File.join(node['gravitee']['install_path'], "graviteeio-management-ui-#{node['gravitee']['version']}")
  link_type :symbolic
end

package 'nginx' do
  action :install
end

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(root_path: File.join(node['gravitee']['install_path'], 'graviteeio-management-ui'))
end

service 'nginx' do
  action [:enable, :start]
  subscribes :reload, 'template[/etc/nginx/nginx.conf]', :immediately
end

template File.join(node['gravitee']['install_path'], 'graviteeio-management-ui', 'constants.json') do
  source 'constants.json.erb'
  owner 'root'
  group 'root'
  mode '0755'
  variables(admin_base_url: node['gravitee']['admin_base_url'], api_base_url: node['gravitee']['api_base_url'])
end
