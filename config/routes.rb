Rails.application.routes.draw do
  resources :types
  resources :categories
  resources :brands
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
