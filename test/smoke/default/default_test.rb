# # encoding: utf-8

# Inspec test for recipe gravitee::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# Test for Java 1.8.0
describe directory('/usr/lib/jvm/java-1.8.0') do
  it { should be_directory }
end

# Test for MongoDb Listening
describe port(27017) do
  it { should be_listening }
end

# Test for ElasticSearch
describe port(9200) do
  it { should be_listening }
end

describe port(9300) do
  it { should be_listening }
end
