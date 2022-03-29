Rails.application.routes.draw do
  devise_for :users
  root 'products#home'
  get 'home', to: 'products#home'
  resources :products do 
    resources :orders
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
