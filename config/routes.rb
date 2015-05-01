Rails.application.routes.draw do
  root to: "sites#index"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  get "/logout", to: "sessions#destroy"

  resources :users do
    resources :posts
  end

end
