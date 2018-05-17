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
      deactivate!
    end

    class OneSky

      attr_accessor :project_id, :subdomain

    end

    def setup
      yield self
    end

    def active?
      active
    end

    def activate!
      @active = true
    end

    def deactivate!
      @active = false
    end

    private

    def active
      @active ||= false
    end


  end
end
