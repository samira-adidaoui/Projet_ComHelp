Rails.application.routes.draw do
  
  
  resources :cgu, only: [:index]
  resources :privacy, only: [:index]
  devise_for :users
  root 'posts#index'
  resources :posts
  
  
end
