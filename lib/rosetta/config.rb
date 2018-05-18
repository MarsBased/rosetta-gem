module Rosetta
  class Config

    attr_accessor :repository

    def initialize
      set_defaults!
    end

    def onesky
      @onesky ||= OneSky.new
    end

    def set_defaults!
      @repository = Rosetta::Repositories::Local
      disable
    end

    class OneSky

      attr_accessor :project_id, :subdomain

    end

    def setup
      yield self
    end

    def enabled?
      active
    end

    def enable
      self.active = true
    end

    def disable
      self.active = false
    end

    private

    def active
      RequestStore.store[:rosetta_enabled] ||= false
    end

    def active=(value)
      RequestStore.store[:rosetta_enabled] = value
    end

  end
end
