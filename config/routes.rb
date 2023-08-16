Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'inventories#index'
  # config/routes.rb
  resources :inventories do
    resources :foods, only: %i[new create]
  end
end
