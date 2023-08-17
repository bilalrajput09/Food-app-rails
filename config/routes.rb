Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'inventories#index'
  # config/routes.rb
  delete '/inventory_delete', to: 'inventories#inventory_destroy'
  resources :inventories do
    resources :foods, only: %i[new create destroy]
  end

  resources :recipes, only: %i[show destroy index] do
    get '/shopping_list', to: 'recipes#shopping_list'
    get '/toggle_recipes_status', to: 'recipes#toggle_recipes_status'
    resources :foods, only: %i[new create destroy]
    resources :recipe_foods, only: [:destroy]
  end
end
