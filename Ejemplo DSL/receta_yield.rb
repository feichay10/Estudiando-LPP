class Recipe
  #attr_accessor :name, :ingredients, :instructions

  def initialize(name)
    @name = name
    @ingredients = []
    @instructions = []

    yield self
  end

  def to_s
    output = @name
    output << "\n#{'=' * @name.size}\n\n"
    output << "Ingredients: #{@ingredients.join(', ')}\n\n"

    @instructions.each_with_index do |instruction, index|
      output << "#{index + 1}) #{instruction}\n"
    end

    output
  end

  def ingredient(name, options = {})
    ingredient = name
    ingredient << " (#{options[:amount]})" if options[:amount]

    @ingredients << ingredient
  end

  def step(text, options = {})
    instruction = text
    instruction << " (#{options[:during]})" if options[:during]

    @instructions << instruction
  end
end

mac_and_cheese = Recipe.new("Noodles and Cheese") do |r| 
  r.ingredient "Water",   :amount => "2 cups"
  r.ingredient "Noodles", :amount => "1 cup"
  r.ingredient "Cheese",  :amount => "1/2 cup"

  r.step "Heat water to boiling.",        :during => "5 minutes"
  r.step "Add noodles to boiling water.", :during => "6 minutes"
  r.step "Drain water."
  r.step "Mix cheese in with noodles."
end

puts mac_and_cheese