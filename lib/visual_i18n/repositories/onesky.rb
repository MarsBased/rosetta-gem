module VisualI18n
  module Repositories
    class Onesky < VisualI18n::Repository

      attr_reader :config

      DEFAULT_LANG_ID = '1'.freeze
      BASE_URL = 'https://osmhfnr.oneskyapp.com/collaboration/translate/project/project'.freeze
      LANGUAGE_FILE_PATH = 'lib/visual_i18n/repositories/onesky/languages_ids.yml'.freeze

      def initialize
        @config = VisualI18n.config
      end

      def self.build_link(keys, code: nil)
        new.phrase_url(keys, code: code)
      end

      def phrase_url(keys, code: nil)
        "#{BASE_URL}/#{project_id}/language/#{lang_id(code)}#/?keyword=#{keys.join('.')}"
      end

      private

      def project_id
        config.onesky_project_id
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
