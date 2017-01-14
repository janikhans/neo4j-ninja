Rails.application.routes.draw do
  resources :vehicle_types
  resources :fitments
  resources :parts
  resources :products
  resources :categories
  resources :vehicles
  resources :vehicle_years
  resources :vehicle_submodels
  resources :vehicle_models
  root to: "brands#index"
  resources :brands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
