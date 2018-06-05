require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

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
end
