# frozen_string_literal: true

module Rosetta
  module Repositories
    class Local < Rosetta::Repository

      def id
        'local'
      end

      def label
        'Repository Local'
      end

      def build_link(keys, **_args)
        path = I18n.load_path.flatten.find { |filename| file_has_phrase?(filename, keys) }
        path && Pathname.new(path).relative_path_from(Rails.root)
      end

      private

      def file_has_phrase?(filename, keys)
        type = File.extname(filename).tr('.', '').downcase
        return unless type == 'yml'

        unless file_translations(filename).is_a?(Hash)
          fail I18n::InvalidLocaleData.new(filename,
                                           'expects it to return a hash, but does not')
        end

        file_translations(filename).dig(I18n.config.locale.to_s, *keys.map(&:to_s))
      end

      # rubocop:disable Style/Send
      def file_translations(filename)
        translations[filename] ||= I18n.backend.send(:load_yml, filename)
      end
      # rubocop:enable Style/Send

      def translations
        @translations ||= {}
      end

    end
  end
end
