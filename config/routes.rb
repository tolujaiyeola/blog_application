Rails.application.routes.draw do
  
  devise_for :users
  root "home#index"
  get "/home" => "home#index", as: :home
  get "/about" => "about#index", as: :about

  # resources :posts
  # get "/posts" => "posts#index"
  # post "/posts/new" => "posts#create", as: :post



  # get "/posts/:id" => "posts#show"
  # patch "/posts/:id" => "posts#update"
  # delete "/posts/:id" => "posts#destroy"

  # get "/posts/edit/:id" => "posts#edit", as: :edit_posts
  # resources :posts, only: [:show] do
  #   resources :comments, only: [:create]
  # end
  resources :posts do
  resources :comments
end
end