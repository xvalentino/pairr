Rails.application.routes.draw do
  root to: 'dashboard#home'
  get '/logout', to: 'sessions#destroy'

  get '/auth/github/callback', to: 'sessions#create'
end
