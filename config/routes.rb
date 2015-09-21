Rails.application.routes.draw do
  resources :users, to: [:new, :create, :show]

  namespace :admin do
    patch "add_points", to: "users#add_points"
    resources :rewards, except: [:show, :index]
  end

  resources :rewards, only: [:show, :index]

  root "users#new"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

end
