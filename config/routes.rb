Rails.application.routes.draw do
  root to: 'dashboard#home'
  get '/logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#show'
  get '/auth/github/callback', to: 'sessions#create'
  get '/match', to: 'match#show'

  resources :users, only: [:edit, :update]
end
