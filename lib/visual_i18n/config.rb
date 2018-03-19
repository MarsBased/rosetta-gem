module VisualI18n
  class Config

    attr_accessor :repository,
                  :onesky_api_key, :onesky_api_secret, :onesky_project_id,
                  :onesky_subdomain

    def initialize
      set_defaults!
    end

    def set_defaults!
      @repository = VisualI18n::Repositories::Local
    end

    def setup
      yield self
    end

  end
end
