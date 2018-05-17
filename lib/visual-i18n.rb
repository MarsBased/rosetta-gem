require 'i18n'
require 'request_store'

require 'visual_i18n/config'
require 'visual_i18n/engine'
require 'visual_i18n/i18n_with_stored_phrases'
require 'visual_i18n/phrase'
require 'visual_i18n/repository'

require 'visual_i18n/repositories/local'
require 'visual_i18n/repositories/onesky'

module VisualI18n
  class << self

    delegate :setup, to: :config
    delegate :repository, to: :config

    def config
      @config ||= Config.new
    end

    def add_phrase(**args)
      fail ArgumentError, 'missing keys argument' if args[:keys].blank?
      fail ArgumentError, 'missing phrase argument' if args[:phrase].blank?

      repository_link = config.repository.build_link(args[:keys], locale: locale)
      phrases << Phrase.new(args[:keys], args[:phrase], repository_link)
    end

    def phrases
      RequestStore.store[:used_phrases] ||= []
    end

    def store_phrases?
      true
    end

    def locale
      I18n.locale
    end

  end
end

module I18n
  class << self

    prepend VisualI18n::I18nWithStoredPhrases

  end
end
