module VisualI18n
  def self.config
    @config ||= Config.new
  end

  def self.setup
    yield config
  end

  delegate :repository, to: :config

  class Config

    attr_accessor :onesky_project_id, :repository

    CONFIG_FILE = '.visual-i18n-config'.freeze

    def initialize
      set_defaults!
    end

    def set_defaults!
      @repository = VisualI18n::Repositories::Local
    end

    def editor
      settings[:editor]
    end

    def editor=(new_editor)
      settings[:editor] = new_editor

      write_settings(editor: new_editor) if new_editor && new_editor != editor
    end

    def settings
      @settings ||= load_settings
    end

    private

    def load_settings
      default_settings.merge(local_settings)
    end

    def write_settings(new_settings)
      File.open(config_file, 'w') do |f|
        f.write(settings.merge(new_settings).to_yaml)
      end
    end

    def local_settings
      YAML.load_file(config_file)
    rescue StandardError
      {}
    end

    def config_file
      if File.exist?("#{Dir.pwd}/#{CONFIG_FILE}")
        "#{Dir.pwd}/#{CONFIG_FILE}"
      else
        "#{Dir.home}/#{CONFIG_FILE}"
      end
    end

    def default_settings
      { editor: default_editor }
    end

    def default_editor
      ENV['GEM_EDITOR'] || ENV['VISUAL'] || ENV['EDITOR'] || '/usr/local/bin/subl'
    end

  end
end
