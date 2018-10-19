# frozen_string_literal: true

module Rosetta
  module Repositories
    class Database < Rosetta::Repository

      def id
        'database'
      end

      def label
        'Database'
      end

      def build_link(_keys, **_args)
        ''
      end

    end
  end
end
