# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/config/environment', __FILE__)

require 'rspec/rails'
require 'rspec/its'

RSpec.configure do |config|
  config.before(:each) do
    Translation.delete_all

    Rosetta.config.set_defaults!
    Rosetta.enable
  end

  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    # Silent puma messages when execute :js tests (rspec 3.7)
    Capybara.server = :puma, { Silent: true }

    driven_by :selenium_chrome_headless
  end
end
