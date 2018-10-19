Rosetta::Engine.routes.draw do
  # scope 'rosetta' do
  resources :repository_databases, constraints: { id: %r{[^\/]+} }
  # end
end
