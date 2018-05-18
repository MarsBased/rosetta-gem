require File.expand_path('../dummy/config/environment', __FILE__)
require 'rspec/rails'
require 'rspec/its'
require 'capybara/rspec'
require 'capybara/webkit'

Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers

  config.before(:each) do
    Rosetta.config.set_defaults!
    Rosetta.enable
  end
end

Capybara.configure do |config|
  config.ignore_hidden_elements = false
end
