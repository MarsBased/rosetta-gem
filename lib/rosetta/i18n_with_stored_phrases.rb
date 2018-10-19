# frozen_string_literal: true

module Rosetta
  module I18nWithStoredPhrases
    def translate(*args)
      output = super
      return output unless Rosetta.enabled?

      keys = normalize_keys('', args.dig(0), args.dig(1, :scope))
      code = keys.join('.')

      Rosetta.add_phrase(keys: keys, phrase: output) if exists?(code, config.locale)

      output
    end
  end
end
