class RecipesController < ApplicationController
   
  def index
    @recipes = current_user.recipes
  end

  def recipe_destroy
    recipe = Recipe.find(params[:recipe_id])
    if recipe.destroy
      flash[:notice] = 'Recipe deleted successfully'
      redirect_to recipes_path
    else
      flash.now = 'Recipe is not deleted'
    end
  end

end
  