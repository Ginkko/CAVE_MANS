Rails.application.routes.draw do
  root 'home#index'
  resources 'home'
  resources 'users'
  resources 'sessions', only: [:new, :create, :destroy]

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

end
