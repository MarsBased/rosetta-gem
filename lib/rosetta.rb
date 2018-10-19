# frozen_string_literal: true

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
      phrases << build_phrase(**args)
    end

    def fetch_all_phrases(locale: I18n.default_locale)
      translations = I18n.backend.translations(do_init: true).fetch(locale.to_sym, {})

      I18n.with_locale(locale.to_sym) do
        [].tap { |phrases| build_phrases_from_translations(translations, phrases) }
      end
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

    def build_phrases_from_translations(translations, phrases, current_key = [])
      translations.each do |key, value|
        if value.is_a? Hash
          build_phrases_from_translations(value, phrases, current_key + [key])
        else
          next if value.blank?
          phrases << build_phrase(keys: current_key + [key], phrase: value)
        end
      end
    end

    def build_phrase(**args)
      fail ArgumentError, 'missing keys argument' if args[:keys].blank?
      fail ArgumentError, 'missing phrase argument' if args[:phrase].blank?

      repository_link = config.repository.build_link(args[:keys], locale: locale)
      Phrase.new(args[:keys], args[:phrase], repository_link)
    end

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
