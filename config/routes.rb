Rails.application.routes.draw do
  namespace :admin do
    resources :categories do
      resources :words
    end
  end
  

  root 'pages#home'

  get "/login",to: 'sessions#new'
  get "/logout", to: 'sessions#destroy'
  resources :sessions, only: :create

  get '/home', to: 'pages#home'
  get '/about' => 'pages#about'

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :users
  get '/signup', to: 'users#new'

  resources :categories, only: [:index] do
    resources :lessons do
      resources :answers, only: [:new, :create]
      resources :activities, module: :lessons
    end
  end

  resources :relationships, only: [:create, :destroy] do
    resources :activities, module: :relationships
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
