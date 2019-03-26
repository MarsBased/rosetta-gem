module Rosetta
  module ControllerAdditions
    extend ActiveSupport::Concern

    included do
      helper_method :rosetta?
      helper_method :rosetta_menu
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
  end
end

ActiveSupport.on_load(:action_controller) do |klass|
  include Rosetta::ControllerAdditions if klass == ActionController::Base
end
