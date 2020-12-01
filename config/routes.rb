Rails.application.routes.draw do
  devise_for :users
	root 'post#index'
  resources :posts
 	resources :team, only: [:index] 
end
