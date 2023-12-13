class RecipeCategoriesController < ApplicationController

  def index
    @recipe_categories = RecipeCategory.all
  end

  def new
    @recipe_category = RecipeCategory.new
  end

  def create
    @recipe_category = current_user.recipe_categories.build(recipe_category_params)
    if @recipe_category.save
      flash[:notice] = 'Categoria de receita cadastrada com sucesso.'
      return redirect_to recipe_categories_path
    end
    flash.now[:alert] = 'Categoria de receita não cadastrada.'
    render :new
  end

  private

  def recipe_category_params
    params.require(:recipe_category).permit(:name)
  end
end