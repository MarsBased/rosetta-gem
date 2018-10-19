# frozen_string_literal: true

module Rosetta
  module DatabaseRepository
    class PhrasesController < BaseController

      def update
        load_or_create_phrase
        build_phrase

        if @phrase.save
          I18n.backend.reload!
        else
          flash[:rosetta_alert] = 'Your new translation not saved.'
        end

        redirect_to params[:current_path]
      end

      def load_or_create_phrase
        key = params[:id]
        locale = I18n.locale

        @phrase = Translation.find_by(key: key, locale: locale) ||
          Translation.new(key: key, locale: locale)
      end

      def build_phrase
        @phrase.attributes = params&.permit(
          :value
        ) || {}
      end

    end
  end
end
