require 'visual_i18n/engine'
require 'visual_i18n/i18n'
require 'request_store'
require 'font-awesome-rails'

module VisualI18n
  class << self

    def add_phrase(**args)
      fail ArgumentError, 'missing code argument' if args[:code].blank?
      fail ArgumentError, 'missing phrase argument' if args[:text].blank?

      phrases << Phrase.new(args[:code], args[:text])
    end

    def phrases
      RequestStore.store[:used_phrases] ||= []
    end

    def store_phrases?
      true
      # !!RequestStore.store[:used_phrases]
    end

  end
  # Your code goes here...

  class Phrase

    attr_reader :code, :text

    def initialize(code, text)
      @code = code
      @text = text
    end

  end
end
