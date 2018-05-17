module VisualI18n
  module I18nWithStoredPhrases
    def translate(*args)
      output = super
      return output unless VisualI18n.active?

      keys = normalize_keys('', args.dig(0), args.dig(1, :scope))
      code = keys.join('.')

      if exists?(code, config.locale)
        VisualI18n.add_phrase(keys: keys, phrase: output)
      end

      output
    end
  end
end
