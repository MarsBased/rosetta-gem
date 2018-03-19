module VisualI18n
  class Repository

    # Default but can override if on the inherit repositories
    def self.id
      label.demodulize.parameterize
    end

    # Default but can override if on the inherit repositories
    def self.label
      name
    end

    # Should be oberride if on the inerit repositories
    def self.build_link(_keys, **_args)
      fail NotImplementedError
    end

  end
end
