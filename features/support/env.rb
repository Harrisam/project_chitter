# Generated by cucumber-sinatra. (2013-09-27 15:28:46 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/chitter.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Capybara.app = CHitter

class CHitterWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  CHitterWorld.new
end
