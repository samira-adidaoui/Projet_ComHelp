Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts
  resources :categories
  resources :team, only: [:index] 

	  scope 'admin', module: 'admin', as: 'admin' do
    resources :landing, only: [:index]
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :posts, only: [:index, :edit, :update, :destroy]
    root 'landing#index'
  end

end
