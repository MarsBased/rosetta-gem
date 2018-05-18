module Rosetta
  class Engine < ::Rails::Engine

    isolate_namespace Rosetta

    initializer :assets do |_config|
      Rails.application.config.assets.precompile += %w[rosetta/language_icon.svg
                                                       rosetta/close.svg]
    end

  end
end
