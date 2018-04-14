Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'
  get '/users/:id/dashboard', to: 'users#dashboard', as: :dashboard
  resources :users, only: [:new, :create, :show, :edit, :update]
end
