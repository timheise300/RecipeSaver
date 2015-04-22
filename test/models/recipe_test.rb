require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @recipe = @user.recipes.build(name: "Food",
                        ingredients: "salt, meat, cheese", 
                        directions: "mix it all together, cook it",
                        user_id: @user.id)
  end
  
  test "should be valid" do
    assert @recipe.valid?
  end
  test "user id should be present" do
    @recipe.user_id = nil
    assert_not @recipe.valid?
  end
  
  test "Name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "Ingredients should be present" do
    @recipe.ingredients = " "
    assert_not @recipe.valid?
  end
  
  test "Directions should be present" do
    @recipe.directions = " "
    assert_not @recipe.valid?
  end
  
  test "Name should be at most 50 characters" do
    @recipe.name = "a" * 51
    assert_not @recipe.valid?
  end
  
  test "Ingredients should be at most 1000 characters" do
    @recipe.ingredients = "a" * 1001
    assert_not @recipe.valid?
  end
  
  test "Directions should be at most 2000 characters" do
    @recipe.directions = "a" * 2001
    assert_not @recipe.valid?
  end
  
  test "order should be most recent first" do
    assert_equal Recipe.first, recipes(:scrambled_eggs)
  end
end
