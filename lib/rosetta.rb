require 'i18n'
require 'request_store'

require 'rosetta/core_ext/dig'

require 'rosetta/config'
require 'rosetta/engine'
require 'rosetta/i18n_with_stored_phrases'
require 'rosetta/phrase'
require 'rosetta/repository'
require 'rosetta/controller_additions'

require 'rosetta/repositories/database'
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
      enabled
    end

    def enable
      self.enabled = true
    end

    def disable
      self.enabled = false
    end

    private

    def enabled
      request[:enabled].nil? ? false : request[:enabled]
    end

    def enabled=(value)
      request[:enabled] = value
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
