class SamplesController < ApplicationController

  before_action :enable_rosetta

  def local
    # Sample of local configuration, this should be in a initializer
    Rosetta.setup do |config|
      config.repository = Rosetta::Repositories::Local
    end

    render :index
  end

  def onesky
    # Sample of onesky configuration, this should be in a initializer
    Rosetta.setup do |config|
      config.onesky.project_id = ENV['ONESKY_PROJECT_ID']
      config.onesky.subdomain = ENV['ONESKY_SUBDOMAIN']
      config.repository = Rosetta::Repositories::Onesky
    end

    render :index
  end

end
