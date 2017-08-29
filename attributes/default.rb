
default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'openjdk'

default['gravitee']['source_url'] = 'http://192.168.2.7:8888/gravitee/'
default['gravitee']['version'] = '1.8.4'
default['gravitee']['api_manager'] = "#{node['gravitee']['source_url']}graviteeio-full-#{node['gravitee']['version']}.zip"

default['gravitee']['install_path'] = '/opt/gravitee'
