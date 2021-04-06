Rails.application.routes.draw do
  resources :products
  resources :carts, only: [:create]
  resources :orders, only: [:index, :create]
  root to: "products#index"
end
