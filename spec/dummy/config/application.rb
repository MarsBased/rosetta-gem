require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

require 'rosetta'

module Dummy
  class Application < Rails::Application

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.load_path += Dir["#{Rails.root}/config/locales/**/*.{rb,yml}"]

    config.active_record.sqlite3.represent_boolean_as_integer = true
  end
end


