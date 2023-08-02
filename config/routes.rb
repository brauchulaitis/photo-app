Rails.application.routes.draw do
  resources :images
  post '/charge', to: 'payments#create'
  resources :payments
  devise_for :users
  root 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
