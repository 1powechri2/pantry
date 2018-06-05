class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
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
end
