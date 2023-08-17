Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'inventories#index'
  # config/routes.rb
  resources :inventories do
    resources :foods, only: %i[new create destroy]
  end

  resources :recipes, only: [:show, :destroy] do
    get '/shopping_list', to: 'recipes#shopping_list'
    get '/toggle_recipes_status', to: 'recipes#toggle_recipes_status'
    resources :foods, only: %i[new create destroy]
    resources :recipe_foods, only: [:destroy]
  end

  
end
