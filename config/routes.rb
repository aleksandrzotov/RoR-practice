Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    resources :reactions, only: %i[create]
  end

  resources  :users
  namespace :api do
    namespace :v1 do
      resources :posts
    end
  end

  get 'login', to: 'sessions#new', as: :login
	post 'login', to: 'sessions#create'
  get 'recovery_password', to: 'recovery_password#new', as: :recovery_password
  post 'recovery_password', to: 'recovery_password#create'
	delete 'logout', to: 'sessions#destroy'
  post 'api/auth', to: 'api/auth#login'
end
