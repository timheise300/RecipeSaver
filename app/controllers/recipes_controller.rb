class RecipesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe created!"
      redirect_to @user
    else
      render 'static_pages/home'
    end
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def index
    @recipes = Recipe.paginate(page: params[:page])
  end

  def destroy
  end
  
  private
  
    def recipe_params
      params.require(:recipe).permit(:name, :ingredients, :directions)
    end
end
