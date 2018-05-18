module Rosetta
  module ControllerAdditions
    extend ActiveSupport::Concern

    included do
      helper_method :rosetta?
    end

    def enable_rosetta
      Rosetta.enable
    end

    def rosetta?
      Rosetta.enabled?
    end
  end
end

ActiveSupport.on_load(:action_controller) do
  include Rosetta::ControllerAdditions
end
