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
        if exists?(code, config.locale)
          filename = load_path.flatten.find { |filename| file_has_phrase?(filename, keys) }
          VisualI18n.add_phrase(keys: keys,
                                text: output,
                                file_path: Pathname.new(filename).relative_path_from(Rails.root))
        end
      end

      output
    end

    def file_has_phrase?(filename, keys)
      type = File.extname(filename).tr('.', '').downcase
      return unless type == 'yml'
      data = backend.send(:load_yml, filename)
      unless data.is_a?(Hash)
        fail InvalidLocaleData.new(filename, 'expects it to return a hash, but does not')
      end

      data.dig(config.locale.to_s, *keys.map(&:to_s))
   end

  end
end
