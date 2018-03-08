require 'request_store'
require 'font-awesome-rails'

require 'visual_i18n/config'
require 'visual_i18n/engine'
require 'visual_i18n/i18n'
require 'visual_i18n/phrase'
require 'visual_i18n/repository'

# Repository local
require 'visual_i18n/repositories/local'

# Repository Onesky
require 'onesky/rails'
require 'visual_i18n/repositories/onesky'
require 'visual_i18n/repositories/onesky/client'

module VisualI18n
  class << self

    delegate :setup, to: :config

    def config
      @config ||= Config.new
    end

    def add_phrase(**args)
      fail ArgumentError, 'missing keys argument' if args[:keys].blank?
      fail ArgumentError, 'missing phrase argument' if args[:text].blank?

      repository_link = config.repository.build_link(args[:keys], code: I18n.locale)
      phrases << Phrase.new(args[:keys], args[:text], repository_link)
    end

    def phrases
      RequestStore.store[:used_phrases] ||= []
    end

    def store_phrases?
      true
      # !!RequestStore.store[:used_phrases]
    end

    def locale
      I18n.locale
    end

  end
end
