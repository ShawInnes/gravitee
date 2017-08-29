
link File.join(node['gravitee']['install_path'], 'graviteeio-gateway') do
  to File.join(node['gravitee']['install_path'], "graviteeio-gateway-#{node['gravitee']['version']}")
  link_type :symbolic
end

pid_file = '/var/run/gravitee-management-api.pid'
systemd_unit 'gravitee-gateway.service' do
  content <<-EOU.gsub(/^\s+/, '')
  [Unit]
  Description=Run Gravitee Service

  [Service]
  Type=forking
  PIDFile=#{pid_file}
  ExecStart=#{File.join(node['gravitee']['install_path'], 'graviteeio-gateway', 'bin', 'gravitee')} -d -p=#{pid_file}
  ExecStop=kill `cat #{pid_file}`

  [Install]
  WantedBy=multi-user.target
  EOU

  action [:create, :enable, :start]
end
