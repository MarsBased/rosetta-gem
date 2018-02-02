require 'visual_i18n/engine'
require 'visual_i18n/i18n'
require 'visual_i18n/repository/local'
require 'request_store'
require 'font-awesome-rails'

module VisualI18n
  class << self

    # attr_accessor :config

    def add_phrase(**args)
      fail ArgumentError, 'missing keys argument' if args[:keys].blank?
      fail ArgumentError, 'missing phrase argument' if args[:text].blank?

      repository_link = config[:repository].build_link(args[:keys])
      phrases << Phrase.new(args[:keys], args[:text], repository_link)
    end

    def phrases
      RequestStore.store[:used_phrases] ||= []
    end

    def store_phrases?
      true
      # !!RequestStore.store[:used_phrases]
    end

    def config
      { repository: Repository::Local }
    end

  end
  # Your code goes here...

  # TODO: Move to other file
  class Phrase

    attr_reader :keys, :text, :repository_link

    def initialize(keys, text, repository_link)
      @keys = keys
      @text = text
      @repository_link = repository_link
    end

    def code
      @keys.join('.')
    end

  end
end
