class SamplesController < ApplicationController

  # This active allow to load the rosetta menu
  before_action :enable_rosetta

  def database
    # Sample of database configuration, this should be in a initializer
    Rosetta.setup do |config|
      config.repository = Rosetta::Repositories::Database.new

      I18n.backend = I18n::Backend::ActiveRecord.new

      I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Memoize)
      I18n::Backend::Simple.send(:include, I18n::Backend::Memoize)
      I18n::Backend::Simple.send(:include, I18n::Backend::Pluralization)

      I18n.backend = I18n::Backend::Chain.new(I18n.backend, I18n::Backend::Simple.new)
    end

    render :index
  end

  def local
    # Sample of local configuration, this should be in a initializer
    Rosetta.setup do |config|
      config.repository = Rosetta::Repositories::Local.new

      # Required I18n::Backend configuration
      I18n.backend = I18n::Backend::Simple.new
    end

    render :index
  end

  def onesky
    # Sample of onesky configuration, this should be in a initializer
    Rosetta.setup do |config|
      config.repository = Rosetta::Repositories::Onesky.new
      config.repository.project_id = ENV['ONESKY_PROJECT_ID']
      config.repository.subdomain = ENV['ONESKY_SUBDOMAIN']

      # Required I18n::Backend configuration
      I18n.backend = I18n::Backend::Simple.new
    end

    render :index
  end

end
