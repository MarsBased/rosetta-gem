Rails.application.routes.draw do

  scope '(:locale)' do
    root to: 'samples#index'
    resource :samples, only: %w[index]
  end

end
