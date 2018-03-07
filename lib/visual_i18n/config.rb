module VisualI18n
  class Config

    attr_accessor :onesky_project_id, :repository

    CONFIG_FILE = '.visual-i18n-config'.freeze

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
