Rails.application.routes.draw do
  resources :checkouts
  resources :sizes
  get 'your-cart', to: 'carts#show'
  resources :order_items
  resources :products 
  resources :categories
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  root 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
