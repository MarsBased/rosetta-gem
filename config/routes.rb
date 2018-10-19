# frozen_string_literal: true

Rosetta::Engine.routes.draw do
  resources :phrases, only: :index

  namespace :database_repository do
    resources :phrases, constraints: { id: %r{[^\/]+} }, only: [:update]
  end
end
