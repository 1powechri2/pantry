require 'minitest/autorun'
require 'minitest/pride'
require './lib/cookbook'
require './lib/recipe'
require 'pry'

class CookBookTest < Minitest::Test
  def test_it_exists
    ckbk = CookBook.new

    assert_instance_of CookBook, ckbk
  end

  def test_it_can_record_recipes
    ckbk = CookBook.new

    assert_equal [], ckbk.recipes

    recipe = Recipe.new("Spaghetti")
    recipe.add_ingredient("Spaghetti Noodles", 10)
    recipe.add_ingredient("Marinara Sauce", 10)
    recipe.add_ingredient("Cheese", 5)

    ckbk.add_recipes(recipe)

    assert_equal [recipe], ckbk.recipes
  end
end
