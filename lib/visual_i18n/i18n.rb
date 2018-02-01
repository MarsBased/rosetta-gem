# frozen_string_literal: true

require 'i18n'

# Monkey patching to the I18n
module I18n
  class << self

    def translate(*args)
      return super unless RequestStore.store[:used_phrases]

      output = super
      code = normalize_keys('', args.dig(0), args.dig(1, :scope)).join('.')

      if exists?(code, config.locale)
        RequestStore.store[:used_phrases] << { code: code, phrase: output }
      end

      output
    end

  end
end
