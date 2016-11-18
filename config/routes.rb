Rails.application.routes.draw do
  get '/register', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  resources :users, except: :index
  resources :votes, only: [:create]
  resources :cohorts
  resources :pitches
  resources :rounds
  resources :admins

  root 'static#index', to: 'static#index'
end
