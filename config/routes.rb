Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  resources :chapters

  get "/all", to: "home#index"
  get "/c/:chapter", to: "home#index"

  root to: 'chapters#index'
end
