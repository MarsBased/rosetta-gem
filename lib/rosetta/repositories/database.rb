module Rosetta
  module Repositories
    class Database < Rosetta::Repository

      def id
        'database'
      end

      def label
        'Database'
      end

      def build_link(keys, **_args); end

    end
  end
end
