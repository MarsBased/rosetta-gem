require 'i18n/backend/active_record'

# Use this hook to configure the repository and other Rosetta options.
Rosetta.setup do |_config|
  # Uncomment the following lines to use the OneSky repository.
  # config.repository = Rosetta::Repositories::Onesky
  # config.onesky.project_id = ENV['ONESKY_PROJECT_ID']
  # config.onesky.subdomain = ENV['ONESKY_SUBDOMAIN']

  # Uncomment the following lines to use the Local repository.
  # config.repository = Rosetta::Repositories::Local
end

Translation = I18n::Backend::ActiveRecord::Translation

if Translation.table_exists?
  I18n.backend = I18n::Backend::ActiveRecord.new

  I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Memoize)
  I18n::Backend::Simple.send(:include, I18n::Backend::Memoize)
  I18n::Backend::Simple.send(:include, I18n::Backend::Pluralization)

  I18n.backend = I18n::Backend::Chain.new(I18n.backend, I18n::Backend::Simple.new)
end
