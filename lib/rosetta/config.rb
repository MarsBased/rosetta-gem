# frozen_string_literal: true

module Rosetta
  class Config

    attr_accessor :repository

    def initialize
      set_defaults!
    end

    def set_defaults!
      @repository = Rosetta::Repositories::Local.new
    end

    def setup
      yield self
    end

  end
end
