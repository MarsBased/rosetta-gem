require File.expand_path('../dummy/config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rspec'

Capybara.javascript_driver = :webkit

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
end

Capybara.configure do |config|
  config.ignore_hidden_elements = false
end
