Rails.application.routes.draw do
  
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :categories
  resources :team, only: [:index] 
  resources :users
end
