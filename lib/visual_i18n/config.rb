module VisualI18n
  class Config

    attr_accessor :repository

    def initialize
      set_defaults!
    end

    def onesky
      @onesky_config ||= OneSky.new
    end

    def set_defaults!
      @repository = VisualI18n::Repositories::Local
    end

    def setup
      yield self
    end

    class OneSky

      attr_accessor :project_id, :subdomain

    end

  end
end
