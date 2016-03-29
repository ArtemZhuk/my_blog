Rails.application.routes.draw do
  get 'voting_ending_job/delete'
  root 'articles#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :users
  resources :sessions
  resources :votes, only: :create
  resources :articles do
  resources :comments
  end
end
