module VisualI18n
  module Repositories
    class Local < VisualI18n::Repository

      def self.build_link(keys)
        path = I18n.load_path.flatten.find { |filename| file_has_phrase?(filename, keys) }
        path && Pathname.new(path).relative_path_from(Rails.root)
      end

      def self.file_has_phrase?(filename, keys)
        type = File.extname(filename).tr('.', '').downcase
        return unless type == 'yml'
        data = I18n.backend.send(:load_yml, filename)
        unless data.is_a?(Hash)
          fail I18n::InvalidLocaleData.new(filename,
                                           'expects it to return a hash, but does not')
        end

        data.dig(I18n.config.locale.to_s, *keys.map(&:to_s))
     end

    end
  end
end
