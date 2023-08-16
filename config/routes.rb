Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'inventories#index'
  resources :inventories, only: %i[show index create] do
    resources :foods, only: %i[new create]
  end

  resources :recipes, only: [:show] do
    get '/shopping_list', to: 'recipes#shopping_list'
    get '/toggle_recipes_status', to: 'recipes#toggle_recipes_status'
    resources :foods, only: %i[new create]
  end
end
