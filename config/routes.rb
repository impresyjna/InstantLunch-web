require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, path: '/api/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      #users
      resources :users, :only => [:show, :create, :update, :destroy,:index]

      #restaurants
      resources :restaurants, :only => [:index]
      #sessions
      delete '/sessions/logout', to: 'sessions#destroy'
      post '/sessions/login', to: 'sessions#create'


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
