
default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'openjdk'

default['gravitee']['source_url'] = 'https://download.gravitee.io/graviteeio-apim/distributions/'
default['gravitee']['version'] = '1.8.4'
default['gravitee']['api_manager'] = "#{node['gravitee']['source_url']}graviteeio-full-#{node['gravitee']['version']}.zip"

default['gravitee']['install_path'] = '/opt/gravitee'
default['gravitee']['admin_password'] = 'admin'

default['gravitee']['admin_base_url'] = 'http://192.168.16.129:8083/management/'
default['gravitee']['api_base_url'] = 'http://192.168.16.129:8082/'
