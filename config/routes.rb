Rails.application.routes.draw do
  root 'orders#menu'
  get '/meals', to: "meals#find_meal", as: "find_meal"
  get '/meals/search', to: "meals#search_results", as: "search_results"

  get '/meal_list', to: "meals#meals_category", as: "meals_data"
  get '/add_meals', to: "meals#add_meal", as: "add_meal"
  post '/meals', to: "meals#create"
  get '/add_ingredients/:meal_id', to: "ingredients#add", as: "add_ingredients"
  post '/add_ingredients/:meal_id', to: "ingredients#create", as: "create_ingredients"
  post '/meals/add_meals_fromAPI', to: 'meals#add_meals_fromAPI'

  get '/edit_meal/:id', to: 'meals#edit', as: "edit_meals"
  resources :meals

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :orders, only: [:index, :create]
  get '/orders', to: 'orders#history'
  get '/orders/new', to: 'orders#menu'

  resources :stocks, only: [:index, :edit, :update]

  get "up" => "rails/health#show", as: :rails_health_check
end
