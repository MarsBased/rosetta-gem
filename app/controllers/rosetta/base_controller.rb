# frozen_string_literal: true

module Rosetta
  class BaseController < ActionController::Base

    layout 'rosetta/application'

    protect_from_forgery with: :exception

  end
end
