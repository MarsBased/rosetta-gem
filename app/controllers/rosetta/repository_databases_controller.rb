module Rosetta
  class RepositoryDatabasesController < ActionController::Base

    def index; end

    def edit; end

    def update
      load_or_create_translate
      build_translate

      if @translation.save
        I18n.backend.reload!
      else
        flash[:rosetta_alert] = 'Your new translation not saved.'
      end

      redirect_to params[:current_path]
    end

    def load_or_create_translate
      key = params[:id]
      locale = I18n.locale

      @translation = Translation.find_by(key: key, locale: locale) ||
        Translation.new(key: key, locale: locale)
    end

    def build_translate
      @translation.attributes = params&.permit(
        :value
      ) || {}
    end

  end
end
