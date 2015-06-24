Rails.application.routes.draw do
  get 'match/show'

  root to: 'dashboard#home'
  get '/logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#show'
  get '/auth/github/callback', to: 'sessions#create'
  get '/match', to: 'match#show'
  post '/match/:id/up', to: 'match#update'
  post '/match/:id/down', to: 'match#destroy'

  resources :users, only: [:edit, :update]
end
