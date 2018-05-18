module VisualI18n
  module ControllerAdditions
    extend ActiveSupport::Concern

    included do
      helper_method :visual_i18n?
    end

    def enable_visual_i18n
      VisualI18n.enable
    end

    def visual_i18n?
      VisualI18n.enabled?
    end
  end
end

ActiveSupport.on_load(:action_controller) do
  include VisualI18n::ControllerAdditions
end
