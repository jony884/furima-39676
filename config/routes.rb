Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users
  root 'items#index'
  post '/users', to: 'devise/registrations#create'

  resources :items, only: [:new, :create, :update, :edit, :update, :show, :destroy] do
    
  end
end
