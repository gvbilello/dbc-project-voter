Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cohort
  resources :pitch
  resources :round
  resources :sessions
  resources :user
  resources :vote

  root 'sessions#index'
end
