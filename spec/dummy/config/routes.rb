Rails.application.routes.draw do
  mount Rosetta::Engine, at: '/rosetta'

  scope '(:locale)' do
    root to: 'samples#index'

    resource :samples, only: %w[index] do
      get 'local'
      get 'onesky'
      get 'database'
    end
  end
end
