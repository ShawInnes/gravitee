
describe port(80) do
  it { should be_listening }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end
