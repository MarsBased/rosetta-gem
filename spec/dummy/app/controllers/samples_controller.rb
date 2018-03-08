class SamplesController < ApplicationController

  def index
    # TODO: move to an specific class to initialize proccess with the config
    # Is requires to initialize Translate Menu
    RequestStore.store[:used_phrases] = []
  end

  def local
    RequestStore.store[:used_phrases] = []

    VisualI18n.setup do |config|
      config.repository = VisualI18n::Repositories::Local
    end

    render :index
  end

  def onesky
    RequestStore.store[:used_phrases] = []

    VisualI18n.setup do |config|
      config.onesky_api_key = ENV['ONESKY_API_KEY']
      config.onesky_api_secret = ENV['ONESKY_API_SECRET']
      config.onesky_project_id = ENV['ONESKY_PROJECT_ID']
      config.onesky_subdomain = ENV['ONESKY_SUBDOMAIN']
      config.repository = VisualI18n::Repositories::Onesky
    end

    render :index
  end

end
