# frozen_string_literal: true

Rosetta::Engine.routes.draw do
  namespace :database_repository do
    resources :phrases, constraints: { id: %r{[^\/]+} }, only: [:update]
  end
end
