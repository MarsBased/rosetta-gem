Rails.application.routes.draw do
  scope '(:locale)' do
    mount Rosetta::Engine, at: '/rosetta'

    root to: 'samples#index'

    resource :samples, only: %w[index] do
      get 'local'
      get 'onesky'
      get 'database'
    end
  end
end
