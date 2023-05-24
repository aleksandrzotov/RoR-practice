Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts, :users

  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end

  get 'login', to: 'sessions#new', as: :login
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
  post 'api/auth', to: 'api/auth#login'
end
