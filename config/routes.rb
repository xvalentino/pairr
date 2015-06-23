Rails.application.routes.draw do
  root to: "dashboard#home"

  get "/auth/github/callback", to: "sessions#create"
end
