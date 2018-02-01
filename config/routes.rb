Rails.application.routes.draw do
  root to: 'samples#index'
  resource :samples, only: %w[index]
end
