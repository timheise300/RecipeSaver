require 'test_helper'

class RecipesInterfaceTest < ActionDispatch::IntegrationTest
 
  def setup
    @user = users(:michael)
  end
  
  test "recipe interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Recipe.count' do
      post recipes_path, recipe: { name: "",
                                   ingredients: "",
                                   directions: ""}
    end
    assert_select 'div#error_explanation'
    # Valid submission
    name = "Vegemite Sandwich"
    ingredients = "bread, vegemite"
    directions = "put the vegemite on the bread"
    assert_difference 'Recipe.count', 1 do
      post recipes_path, recipe: { name: name,
                                   ingredients: ingredients,
                                   directions: directions}
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match directions, response.body
    # Delete a post.
    assert_select 'a', text: 'delete'
    first_recipe = @user.recipes.paginate(page: 1).first
    assert_difference 'Recipe.count', -1 do
      delete recipe_path(first_recipe)
    end
    # Visit a different user.
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
   
end
