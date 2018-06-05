require_relative 'recipe'

class Pantry
  attr_reader :stock,
              :shopping_list

  def initialize
    @stock = {}
    @shopping_list = nil
  end

  def stock_check(item)
    if @stock[item] != nil
      @stock[item]
    else
      0
    end
  end

  def restock(item, unit)
    if @stock[item] != nil
      @stock[item] += unit
    else
      @stock[item] = unit
    end
  end

  def add_to_shopping_list(recipe)
    if @shopping_list != nil
      @shopping_list.merge!(recipe.ingredients) do |key, old_value, new_value|
        old_value + new_value
      end
    else
      @shopping_list = recipe.ingredients
    end
  end

  def print_shopping_list
    print_list = @shopping_list.inject("") do |string, (k, v)|
      string += "* #{k}: #{v}\n"
      string
    end
    print_list.chop
  end
end
