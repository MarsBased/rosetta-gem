# frozen_string_literal: true

module Rosetta
  class Repository

    def id
      label.demodulize.parameterize
    end

    def label
      name
    end

    def build_link(_keys, **_args)
      fail NotImplementedError
    end

  end
end
