require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/api/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      #sessions
      delete '/sessions/logout', to: 'sessions#destroy'
      post '/sessions/login', to: 'sessions#create'

      #users
      resources :users, :only => [:show, :create, :update, :destroy,:index]

      #customers
      resources :customers, :only => [:create, :update]

      #restaurants
      get '/restaurants/favorite', to: 'restaurants#favorite'
      resources :restaurants, :only => [:index]

      #dish_categories
      resources :dish_categories, :only => [:index]


      devise_for :users
    end
  end

  root 'static_pages#home'

  post   'login'   => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'dashboard' => 'dashboard#index'
  post 'register_owner' => 'restaurant_owners#create'
  get 'generate_qr_code' => 'tables#generate_qr_code'
  post 'add_dish_to_menu' => 'menus#add_dish'
  get 'index_of_actual_situation' => 'tables#index_of_actual_situation'
  get 'actual_situation' => 'tables#actual_situation'

  resources :users
  resources :restaurants
  resources :restaurant_owners
  resources :dish_categories
  resources :tables
  resources :waiters
  resources :menus
  resources :orders
  resources :order_statuses
  resources :dishes
  resources :menu_dishes
end
