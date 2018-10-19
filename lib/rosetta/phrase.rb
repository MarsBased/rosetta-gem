# frozen_string_literal: true

module Rosetta
  class Phrase

    attr_reader :keys, :text, :repository_link

    def initialize(keys, text, repository_link)
      @keys = keys
      @text = text
      @repository_link = repository_link
    end

    def code
      @keys.join('.')
    end

  end
end
