# frozen_string_literal: true

module Rosetta
  module ControllerAdditions
    extend ActiveSupport::Concern

    included do
      helper_method :rosetta?
      helper_method :rosetta_menu
      helper_method :database_repository_phrase_vue_path
    end

    def enable_rosetta
      Rosetta.enable
    end

    def rosetta?
      Rosetta.enabled?
    end

    def rosetta_menu
      'rosetta/translate_menu'
    end

    def database_repository_phrase_vue_path
      base_path = rosetta.database_repository_phrase_path('__').gsub('__', '')
      "'#{base_path}' + phrase.code "
    end
  end
end

ActiveSupport.on_load(:action_controller) do
  include Rosetta::ControllerAdditions
end
