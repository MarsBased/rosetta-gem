module VisualI18n
  class Repository

    def self.id
      label.demodulize.parameterize
    end

    def self.label
      name
    end

    def self.build_link(_keys, **_args)
      fail NotImplementedError
    end

  end
end
