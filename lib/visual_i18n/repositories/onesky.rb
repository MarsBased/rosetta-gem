module VisualI18n
  module Repositories
    class OneSky < VisualI18n::Repository

      def self.build_link(keys)
        "https://osmhfnr.oneskyapp.com/collaboration/translate/project/project/#{project_id}/language/#{lang_code}#/?keyword=#{keys.join('.')}"
      end

      def self.project_id
        VisualI18n.config[:repository][:onesky_project_id]
      end

      def self.lang_code
        # TODO: Get codes
        '1'
      end

    end
  end
end
