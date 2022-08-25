Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "cats#index"
  resources :cats do
    resources :bookings, only: [:new, :create]
  end
  devise_for :users
  resources :bookings, only: [:index, :destroy]
  get "my_cats", to: "cats#my_cats", as: :my_cats
end
