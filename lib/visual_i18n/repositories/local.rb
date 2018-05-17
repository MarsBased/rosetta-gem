module VisualI18n
  module Repositories
    class Local < VisualI18n::Repository

      def self.id
        'local'
      end

      def self.label
        'Repository Local'
      end

      def self.build_link(keys, **_args)
        path = I18n.load_path.flatten.find { |filename| file_has_phrase?(filename, keys) }
        path && Pathname.new(path).relative_path_from(Rails.root)
      end

      def self.file_has_phrase?(filename, keys)
        type = File.extname(filename).tr('.', '').downcase
        return unless type == 'yml'

        unless file_translations(filename).is_a?(Hash)
          fail I18n::InvalidLocaleData.new(filename,
                                           'expects it to return a hash, but does not')
        end

        file_translations(filename).dig(I18n.config.locale.to_s, *keys.map(&:to_s))
      end

      # rubocop:disable Style/Send
      def self.file_translations(filename)
        translations[filename] ||= I18n.backend.send(:load_yml, filename)
      end
      # rubocop:enable Style/Send

      def self.translations
        @translations ||= {}
      end

    end
  end
end
