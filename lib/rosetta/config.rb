module Rosetta
  class Config

    attr_accessor :repository

    def initialize
      set_defaults!
    end

    def set_defaults!
      @repository = Rosetta::Repositories::Local
    end

    def setup
      yield self
    end

    def onesky
      @onesky ||= OneSky.new
    end

    class OneSky

      attr_accessor :project_id, :subdomain

    end

  end
end
