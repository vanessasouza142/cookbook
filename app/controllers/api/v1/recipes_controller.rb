class API::V1::RecipesController < ActionController::API
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_json = recipe.as_json(except: [:created_at, :updated_at])
  end
end