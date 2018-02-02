require 'request_store'
require 'font-awesome-rails'

require 'visual_i18n/config'
require 'visual_i18n/engine'
require 'visual_i18n/i18n'
require 'visual_i18n/phrase'
require 'visual_i18n/repository'
require 'visual_i18n/repositories/local'
require 'request_store'
require 'font-awesome-rails'

module VisualI18n
  class << self

    def add_phrase(**args)
      fail ArgumentError, 'missing keys argument' if args[:keys].blank?
      fail ArgumentError, 'missing phrase argument' if args[:text].blank?

      repository_link = config.repository.build_link(args[:keys])
      phrases << Phrase.new(args[:keys], args[:text], repository_link)
    end

    def phrases
      RequestStore.store[:used_phrases] ||= []
    end

    def store_phrases?
      true
      # !!RequestStore.store[:used_phrases]
    end

  end
end
