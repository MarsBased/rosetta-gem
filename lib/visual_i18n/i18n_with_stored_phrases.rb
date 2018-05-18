module VisualI18n
  module I18nWithStoredPhrases
    def translate(*args)
      output = super
      return output unless VisualI18n.enabled?

      keys = normalize_keys('', args.dig(0), args.dig(1, :scope))
      code = keys.join('.')

      VisualI18n.add_phrase(keys: keys, phrase: output) if exists?(code, config.locale)

      output
    end
  end
end
