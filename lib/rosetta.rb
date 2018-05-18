require 'i18n'
require 'request_store'

require 'rosetta/config'
require 'rosetta/engine'
require 'rosetta/i18n_with_stored_phrases'
require 'rosetta/phrase'
require 'rosetta/repository'
require 'rosetta/controller_additions'

require 'rosetta/repositories/local'
require 'rosetta/repositories/onesky'

module Rosetta
  class << self

    delegate :repository, :setup, to: :config

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
      request[:used_phrases] ||= []
    end

    def locale
      I18n.locale
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
      request[:actived].nil? ? false : request[:actived]
    end

    def active=(value)
      request[:actived] = value
    end

    def request
      RequestStore.store[:rosetta] ||= {}
    end

  end
end

module I18n
  class << self

    prepend Rosetta::I18nWithStoredPhrases

  end
end
