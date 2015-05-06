require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  
  def setup
    @recipe = recipes(:scrambled_eggs)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Recipe.count' do
      post :create, recipe: { name: "Fake Recipe",
                              ingredients: "Unicorn bacon",
                              directions: "Just eat the bacon"}
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Recipe.count' do
      delete :destroy, id: @recipe
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong recipe" do
    log_in_as(users(:michael))
    recipe = recipes(:pbj_sandwich)
    assert_no_difference 'Recipe.count' do
      delete :destroy, id: recipe
    end
    assert_redirected_to root_url
  end
end
