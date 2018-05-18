class SamplesController < ApplicationController

  # This active allow to load the roseta menu
  before_action :enable_rosetta

  def local
    # Sample of local configuration, this should be in a initializer
    Rosetta.setup do |config|
      config.repository = Rosetta::Repositories::Local.new
    end

    render :index
  end

  def onesky
    # Sample of onesky configuration, this should be in a initializer
    Rosetta.setup do |config|
      config.repository = Rosetta::Repositories::Onesky.new
      config.repository.project_id = ENV['ONESKY_PROJECT_ID']
      config.repository.subdomain = ENV['ONESKY_SUBDOMAIN']
    end

    render :index
  end

end
