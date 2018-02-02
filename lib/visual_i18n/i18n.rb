# frozen_string_literal: true

require 'i18n'

# Monkey patching to the I18n
module I18n
  class << self

    def translate(*args)
      output = super

      if VisualI18n.store_phrases?

        code = normalize_keys('', args.dig(0), args.dig(1, :scope)).join('.')

        if exists?(code, config.locale)
          VisualI18n.add_phrase(code: code, text: output)
        end
      end

      output
    end

  end
end
