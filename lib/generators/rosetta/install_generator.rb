# frozen_string_literal: true

require 'rails/generators/base'

module Rosetta
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a Rosetta initializer'

      def copy_initializer
        template 'rosetta.rb', 'config/initializers/rosetta.rb'
      end

      def rails_4?
        Rails::VERSION::MAJOR == 4
      end

    end
  end
end
