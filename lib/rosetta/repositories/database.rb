# frozen_string_literal: true

module Rosetta
  module Repositories
    class Database < Rosetta::Repository

      include Rosetta::Engine.routes.url_helpers

      def id
        'database'
      end

      def label
        'Database'
      end

      def build_link(keys, **_args)
        database_repository_phrase_path(keys.join('.'))
      end

    end
  end
end
