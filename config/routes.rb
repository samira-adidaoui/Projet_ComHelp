Rails.application.routes.draw do
  
  devise_for :users
  root 'posts#index'
  resources :posts
  get '/post/:id/participation', to: 'posts#participation', as: 'participation'
  resources :categories
  resources :team, only: [:index] 
  resources :users
end
