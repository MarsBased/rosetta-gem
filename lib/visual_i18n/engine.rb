module VisualI18n
  class Engine < ::Rails::Engine

    isolate_namespace VisualI18n

    initializer :assets do |_config|
      Rails.application.config.assets.precompile += %w[visual_i18n/language_icon.svg]
    end

  end
end
