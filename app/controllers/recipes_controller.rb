class RecipesController < ApplicationController
    # before_action :authenticate_user!, except: [:public_index, :show]
  
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    # before_action :authorize_user!, only: [:edit, :update, :destroy, :toggle_visibility]
  
    def index
      @user_recipes = User.first.recipes
    end
  
    def public_index
      @public_recipes = Recipe.public.order(created_at: :desc)
    end
  
    def show
    end
  
    def destroy
      @recipe.destroy
      redirect_to recipes_path, notice: "Recipe was successfully deleted."
    end
  
    def new
      @recipe = User.first.recipes.build
    end
  
    def create
      @recipe = User.first.recipes.build(recipe_params)
      if @recipe.save
        redirect_to recipe_path(@recipe), notice: "Recipe was successfully created."
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe), notice: "Recipe was successfully updated."
      else
        render :edit
      end
    end
  
    # def toggle_visibility
    #   @recipe.toggle!(:public)
    #   redirect_to recipe_path(@recipe)
    # end
  
    private
  
    def find_recipe
      @recipe = Recipe.find(params[:id])
    end
  
    # def authorize_user!
    #   return if can_modify_recipe?(@recipe)
    #   redirect_to recipe_path(@recipe), alert: "You do not have permission to perform this action."
    # end
  
    # def recipe_params
    #   params.require(:recipe).permit(:name, :description, :public)
    # end
  
    # def can_modify_recipe?(recipe)
    #   user_signed_in? && recipe.user == User.first
    # end
  end
  