class StaticPagesController < ApplicationController
  
  def home
    @tenRecipes = Recipe.all.order(created_at: :DESC).limit(10)
  end

  def help
  end
  
  def about
  end
end
