module Rosetta
  module Repositories
    class Onesky < Rosetta::Repository

      attr_accessor :project_id, :subdomain

      def label
        'Onesky'
      end

      def build_link(keys, locale: nil)
        phrase_url(keys, locale: locale.to_s)
      end

      def phrase_url(keys, locale: nil)
        code = keys.join('.')
        "#{base_url}/#{project_id}/language/#{lang_id(locale)}#/?keyword=#{code}"
      end

      private

      DEFAULT_LANG_ID = '1'.freeze
      LANGUAGE_FILE_PATH = 'lib/rosetta/repositories/onesky/languages_ids.yml'.freeze

      def base_url
        "https://#{subdomain}.oneskyapp.com/collaboration/translate/project/project"
      end

      def lang_id(lang_iso_code = nil)
        languages[lang_iso_code || I18n.locale] || DEFAULT_LANG_ID
      end

      def languages
        YAML.safe_load(File.read(File.expand_path(LANGUAGE_FILE_PATH, Engine.root)))
      end

    end
  end
end
