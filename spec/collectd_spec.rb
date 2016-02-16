require_relative './spec_helper.rb'

describe 'ubuntu collectd', if: %w[debian ubuntu].include?(os[:family]) do
  describe file('/usr/share/collectd/types.db') do
    it { should be_file }
  end

  describe port(25826) do
    it { should be_listening }
  end
end
