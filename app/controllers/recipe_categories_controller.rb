class RecipeCategoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[create new index]
  before_action :authorize_user, only: %i[create new index]

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

  def authorize_user
    return redirect_to root_path unless current_user.admin?
  end
end