require_relative './spec_helper.rb'

# Wait for the converge to be complete before verification
sleep(3)

describe 'ubuntu', if: %w[debian ubuntu].include?(os[:family]) do
  describe group('influxdb') do
    it { should exist }
  end

  describe user('influxdb') do
    it { should exist }
  end

  describe package('influxdb') do
    it { should be_installed }
  end

  %w[data meta wal].each do |dir|
    describe file("/var/lib/influxdb/#{dir}") do
      it { should be_directory }
    end
  end

  describe file('/etc/influxdb/influxdb.conf') do
    it { should be_file }
  end

  describe port(8088) do
    it { should be_listening }
  end

  describe port(8083) do
    it { should be_listening }
  end

  describe process('influxd') do
    it { should be_running }
  end

  describe command('curl -o /dev/null http://localhost:8083') do
    its(:exit_status) { should be_zero }
  end

  describe command('curl -G http://localhost:8086/query --data-urlencode "q=CREATE DATABASE testdb"') do
    its(:exit_status) { should be_zero }
  end

  describe command('curl -i -XPOST "http://localhost:8086/write?db=testdb" --data-binary "cpu_load_short,host=server01,region=us-west value=0.64 1434055562000000000"') do
    its(:exit_status) { should be_zero }
  end

  describe command('curl -G "http://localhost:8086/query?pretty=true" --data-urlencode "db=testdb" --data-urlencode "q=SELECT value FROM cpu_load_short WHERE region=\'us-west\'"') do
    its(:exit_status) { should be_zero }
  end
end
