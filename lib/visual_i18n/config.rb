module VisualI18n

  def self.config
    @config ||= Config.new
  end

  class Config
    CONFIG_FILE = '.visual-i18n-config'

    def editor
      settings[:editor]
    end

    def repository
      settings[:repository]
    end

    def editor=(new_editor)
      settings[:editor] = new_editor

      if new_editor && new_editor != editor
        write_settings(editor: new_editor)
      end
    end

    def repository=(new_repository)
      settings[:repository] = new_repository
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
    rescue
      {}
    end

    def config_file
      if File.exists?("#{Dir.pwd}/#{CONFIG_FILE}")
        "#{Dir.pwd}/#{CONFIG_FILE}"
      else
        "#{Dir.home}/#{CONFIG_FILE}"
      end
    end

    def default_settings
      { editor: default_editor, repository: Repository::Local }
    end

    def default_editor
      ENV['GEM_EDITOR'] || ENV['VISUAL'] || ENV['EDITOR'] || '/usr/local/bin/subl'
    end
  end
end
