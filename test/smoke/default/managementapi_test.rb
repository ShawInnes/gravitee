
# Test for Gravitee Management API
describe directory('/opt/gravitee/graviteeio-management-api-1.8.4') do
  it { should be_directory }
end

describe port(8083) do
  it { should be_listening }
end
