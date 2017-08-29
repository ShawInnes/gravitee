
# Test for Gravitee Gateway
describe directory('/opt/gravitee/graviteeio-gateway-1.8.4') do
  it { should be_directory }
end

describe port(8082) do
  it { should be_listening }
end

describe http('http://127.0.0.1:8082/', method: 'GET') do
  its('status') { should eq 404 }
  its('body') { should eq 'No context-path matches the request URI.' }
end
