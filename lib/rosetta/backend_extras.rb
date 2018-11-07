# frozen_string_literal: true

module Rosetta
  module BackendExtras
    class Base

      attr_reader :backend

      def initialize(backend: I18n.backend)
        @backend = backend
      end

    end

    class Simple < Base

      def translates_list(locale: I18n.default_locale)
        translations = backend.translations(do_init: true).fetch(locale.to_sym, {})

        {}.tap { |phrases| build_phrases_from_translations(translations, phrases) }
      end

      private

      def build_phrases_from_translations(translations, phrases, current_key = [])
        translations.each do |key, value|
          if value.is_a? Hash
            build_phrases_from_translations(value, phrases, current_key + [key])
          else
            next if value.blank?

            phrases[(current_key + [key]).join('.')] = value
          end
        end
      end

    end

    class ActiveRecord < Base

      def translates_list(locale: I18n.default_locale)
        {}.tap do |phrases|
          translation_klass.where(locale: locale).find_each do |translation|
            phrases[translation.key] = translation.value
          end
        end
      end

      private

      def translation_klass
        I18n::Backend::ActiveRecord::Translation
      end

    end

    class Chain < Base

      def translates_list(locale: I18n.default_locale)
        output = {}
        backend.backends.reverse_each do |chained_backend|
          output = output.merge(backend_factory(chained_backend)
                         .translates_list(locale: locale))
        end
        output
      end

      private

      def backend_factory(backend_to_factory)
        if backend_to_factory.class == I18n::Backend::ActiveRecord
          ActiveRecord.new(backend: backend_to_factory)
        elsif backend_to_factory.class == I18n::Backend::Simple
          Simple.new(backend: backend_to_factory)
        end
      end

    end
  end
end
