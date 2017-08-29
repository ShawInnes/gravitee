
link File.join(node['gravitee']['install_path'], 'graviteeio-management-api') do
  to File.join(node['gravitee']['install_path'], "graviteeio-management-api-#{node['gravitee']['version']}")
  link_type :symbolic
end

pid_file = '/var/run/gravitee-management-api.pid'
systemd_unit 'gravitee-management-api.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Run Gravitee Management API Service

  [Service]
  Type=forking
  PIDFile=#{pid_file}
  ExecStart=#{File.join(node['gravitee']['install_path'], 'graviteeio-management-api', 'bin', 'gravitee')} -d -p=#{pid_file}
  ExecStop=kill `cat #{pid_file}`

  [Install]
  WantedBy=multi-user.target
  EOU

  action [:create, :enable, :start]
end
