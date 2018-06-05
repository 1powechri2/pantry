class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipes(recipe)
    @recipes << recipe
  end 
end
