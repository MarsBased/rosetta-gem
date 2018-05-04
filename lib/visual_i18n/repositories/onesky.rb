module VisualI18n
  module Repositories
    class Onesky < VisualI18n::Repository

      def self.label
        'Onesky'
      end

      def self.build_link(keys, code: nil)
        new.phrase_url(keys, code: code.to_s)
      end

      def phrase_url(keys, code: nil)
        "#{base_url}/#{project_id}/language/#{lang_id(code)}#/?keyword=#{keys.join('.')}"
      end

      private

      DEFAULT_LANG_ID = '1'.freeze
      LANGUAGE_FILE_PATH = 'lib/visual_i18n/repositories/onesky/languages_ids.yml'.freeze

      delegate :onesky_project_id, :onesky_subdomain,
               to: :config
      alias project_id onesky_project_id
      alias subdomain onesky_subdomain

      def config
        VisualI18n.config
      end

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
