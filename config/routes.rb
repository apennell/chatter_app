Rails.application.routes.draw do
  root to: "sites#index"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  get "/logout", to: "sessions#destroy"

  get "/posts", to: "posts#index"

  get "/posts/new", to: "posts#new"

  get "/posts/:id", to: "posts#show"

  post "/posts", to: "posts#create"

  resources :users do
    resources :posts
  end

end
