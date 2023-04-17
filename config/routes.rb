Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts, :users

  get 'login', to: 'sessions#new', as: :login
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
end
