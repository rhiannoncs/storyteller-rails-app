Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  get '/users/:id/dashboard', to: 'users#dashboard', as: :dashboard
  resources :users, only: [:new, :create, :show, :edit, :update]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create_omniauth'

  resources :stories, only: [:index, :new, :create, :show, :edit, :update] do
    resources :submissions, only: [:index, :new, :create, :edit, :update]
  end

  resources :prompts, only: [:index, :new, :create]

  resources :teams, only: [:index, :new, :create, :show]


  post '/join' => 'memberships#create'

end
