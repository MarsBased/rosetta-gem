module Rosetta
  class PhrasesController < BaseController

    def index
      @selected_locale = (params[:locale] || I18n.default_locale).to_sym
      @phrases = Rosetta.fetch_all_phrases(locale: @selected_locale)
    end

  end
end
