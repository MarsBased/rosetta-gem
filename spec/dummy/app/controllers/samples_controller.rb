class SamplesController < ApplicationController

  before_action :initialize_visual_i18n

  def local
    # Sampel of local configuration, this should be in a initializer
    VisualI18n.setup do |config|
      config.repository = VisualI18n::Repositories::Local
    end

    render :index
  end

  def onesky
    # Sampel of onesky configuration, this should be in a initializer
    VisualI18n.setup do |config|
      config.onesky_api_key = ENV['ONESKY_API_KEY']
      config.onesky_api_secret = ENV['ONESKY_API_SECRET']
      config.onesky_project_id = ENV['ONESKY_PROJECT_ID']
      config.onesky_subdomain = ENV['ONESKY_SUBDOMAIN']
      config.repository = VisualI18n::Repositories::Onesky
    end

    render :index
  end

  private

  def initialize_visual_i18n
    # TODO: move to an specific class to initialize proccess with the config
    # Is requires to initialize Translate Menu
    RequestStore.store[:used_phrases] = []
  end

end
