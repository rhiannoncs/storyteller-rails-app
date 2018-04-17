Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  get '/users/:id/dashboard', to: 'users#dashboard', as: :dashboard
  resources :users, only: [:new, :create, :show, :edit, :update]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create_omniauth'

  resources :stories, only: [:new, :create, :show]

  resources :prompts, only: [:new, :create, :index]

  resources :teams, only: [:new, :create, :index]
end
