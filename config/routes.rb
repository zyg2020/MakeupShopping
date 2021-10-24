Rails.application.routes.draw do
  resources :pages, except: [:show]
  get "/pages/:permalink" => "pages#permalink", as: "permalink"

  root to: "products#index"

  resources :colors
  resources :products do
    collection do
      # match "search" => "products#search", via: %i[get post], as: :search
      get "search"
    end
  end
  resources :tags
  resources :malls
  resources :types
  resources :categories
  resources :brands

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
