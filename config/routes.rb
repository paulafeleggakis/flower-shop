Rails.application.routes.draw do
  resources :bundles
  resources :line_items
  resources :products

  resources :orders do
    resources :line_items
  end

  root 'orders#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
