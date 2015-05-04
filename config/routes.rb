Rails.application.routes.draw do
  root to: "sites#index"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  get "/logout", to: "sessions#destroy"

  get "/posts", to: "posts#index", as: "posts"

  get "/posts/new", to: "posts#new", as: "new_post"

  get "/posts/:id", to: "posts#show", as: "post"

  get "/posts/:id/edit", to: "posts#edit", as: "edit_article"

  post "/posts", to: "posts#create"

  patch "/posts/:id", to: "posts#update"

  delete "/posts/:id", to: "posts#destroy"

  resources :users do
    resources :posts
  end

end
