class StaticPagesController < ApplicationController
  
  def home
    @tenRecipes = Recipe.all.order(created_at: :DESC).limit(10)
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end
  
  def about
  end
end
