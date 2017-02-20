Rails.application.routes.draw do
  resources :bundles
  resources :line_items
  resources :products
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
