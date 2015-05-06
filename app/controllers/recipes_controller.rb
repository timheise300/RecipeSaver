class RecipesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
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
    @recipe.destroy
    flash[:success] = "Recipe deleted"
    redirect_to request.referrer || root_url
  end
  
  private
  
    def recipe_params
      params.require(:recipe).permit(:name, :ingredients, :directions, :picture)
    end
  
    def correct_user
      @recipe = current_user.recipes.find_by(id: params[:id])
      redirect_to root_url if @recipe.nil?
    end
  
end
