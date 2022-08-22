Rails.application.routes.draw do
  get 'cats/index'
  get 'cats/show'
  get 'cats/new'
  get 'cats/create'
  get 'cats/edit'
  get 'cats/update'
  get 'cats/destroy'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
