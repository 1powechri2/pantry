require './lib/pantry'
require './lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
  end

  def test_it_has_attributes
    assert_equal ({}), @pantry.stock
  end

  def test_stock_check
    test_stock = @pantry.stock_check('Cheese')

    assert_equal 0, test_stock
  end

  def test_restock
    stock = 'Cheese'
    unit_1 = 10
    unit_2 = 20

    @pantry.restock(stock, unit_1)

    assert_equal 10, @pantry.stock_check('Cheese')

    @pantry.restock(stock, unit_2)

    assert_equal 30, @pantry.stock_check('Cheese')
  end

  def test_shopping_list
    recipe = Recipe.new("Cheese Pizza")

    assert_equal ({}), recipe.ingredients

    recipe.add_ingredient("Cheese", 20)
    recipe.add_ingredient("Flour", 20)

    expected_1 = {"Cheese" => 20, "Flour" => 20}
    actual_1   = recipe.ingredients

    assert_equal expected_1, actual_1

    @pantry.add_to_shopping_list(recipe)

    assert_equal ({"Cheese" => 20, "Flour" => 20}), @pantry.shopping_list

    spaghetti = Recipe.new("Spaghetti")
    spaghetti.add_ingredient("Spaghetti Noodles", 10)
    spaghetti.add_ingredient("Marinara Sauce", 10)
    spaghetti.add_ingredient("Cheese", 5)
    @pantry.add_to_shopping_list(spaghetti)

    expected_2 = {"Cheese" => 25, "Flour" => 20,
                "Spaghetti Noodles" => 10,
                "Marinara Sauce" => 10}

    actual_2   = @pantry.shopping_list

    assert_equal expected_2, actual_2
  end

  def test_print_shopping_list
    recipe = Recipe.new("Cheese Pizza")

    recipe.add_ingredient("Cheese", 20)
    recipe.add_ingredient("Flour", 20)

    @pantry.add_to_shopping_list(recipe)

    spaghetti = Recipe.new("Spaghetti")
    spaghetti.add_ingredient("Spaghetti Noodles", 10)
    spaghetti.add_ingredient("Marinara Sauce", 10)
    spaghetti.add_ingredient("Cheese", 5)
    @pantry.add_to_shopping_list(spaghetti)

    expected = "* Cheese: 25\n* Flour: 20\n* Spaghetti Noodles: 10\n* Marinara Sauce: 10"
    actual   = @pantry.print_shopping_list

    assert_equal expected, actual
  end
end
