Rails.application.routes.draw do
  
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :categories
  resources :team, only: [:index] 
  resources :users

	  scope 'admin', module: 'admin', as: 'admin' do
    resources :landing, only: [:index]
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :posts, only: [:create, :index, :edit, :update, :destroy]
    root 'landing#index'
  end

end
