require 'rubygems'
require 'bundler/setup'

require 'serverspec'
require 'pathname'
require 'net/ssh'

RSpec.configure do
  set :host, ENV['TARGET_HOST']
  set :request_pty, true
end
