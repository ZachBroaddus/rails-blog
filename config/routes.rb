Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users

  resources :posts do
    resources :comments
  end

  root "posts#index"

  get '/about', to: 'pages#about'
end
