# frozen_string_literal: true

require 'i18n'

# Monkey patching to the I18n
module I18n
  class << self

    def translate(*args)
      output = super

      if VisualI18n.store_phrases?
        keys = normalize_keys('', args.dig(0), args.dig(1, :scope))
        code = keys.join('.')

        VisualI18n.add_phrase(keys: keys, text: output) if exists?(code, config.locale)
      end

      output
    end

  end
end
