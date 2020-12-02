Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
    put '/post/:id/participation', to: 'posts#participation', as: 'paticipation'
  resources :categories
  resources :team, only: [:index] 

end
