Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  get 'home/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "home#index"
  resources :home, only: [ :index, :show ]

  resources :carts do 
    post :add_item_to_cart, on: :collection
    put :increament_item, on: :collection
    put :decreament_item, on: :collection
    delete :destroy_item, on: :collection
  end

  resources :orders
  resources :addresses
end
