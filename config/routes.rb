Rails.application.routes.draw do
  root 'orders#new'
  get '/meals', to: "meals#find_meal", as: "find_meal"
  get '/meal_list', to: "meals#meals_category", as: "meals_data"
  post '/meals', to: "meals#create" 

  devise_for :users
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
