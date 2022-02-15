Rails.application.routes.draw do
  root 'pages#home'

  get "/login",to: 'sessions#new'
  get "/logout", to: 'sessions#destroy'
  resources :sessions, only: :create

  get '/home', to: 'pages#home'
  get '/about' => 'pages#about'

  resources :users
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
