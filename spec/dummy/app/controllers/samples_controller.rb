class SamplesController < ApplicationController

  before_action :enable_visual_i18n

  def local
    # Sample of local configuration, this should be in a initializer
    VisualI18n.setup do |config|
      config.repository = VisualI18n::Repositories::Local
    end

    render :index
  end

  def onesky
    # Sample of onesky configuration, this should be in a initializer
    VisualI18n.setup do |config|
      config.onesky.project_id = ENV['ONESKY_PROJECT_ID']
      config.onesky.subdomain = ENV['ONESKY_SUBDOMAIN']
      config.repository = VisualI18n::Repositories::Onesky
    end

    render :index
  end

end
