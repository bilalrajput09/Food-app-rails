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

  delete '/recipe_delete', to: 'recipes#recipe_destroy'
  get '/public_recipes', to: 'recipes#public_recipes'
  resources :recipes, only: %i[index show destroy new create] do
    get '/toggle_recipes_status', to: 'recipes#toggle_recipes_status'
    resources :foods, only: %i[new create destroy]
    resources :recipe_foods, only: [:destroy]
  end
  get '/shopping_list', to: 'recipes#shopping_list', as: 'shopping_list'
end
