Rails.application.routes.draw do
  get 'categories/show'
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :categories, only: [:show]
  
end
