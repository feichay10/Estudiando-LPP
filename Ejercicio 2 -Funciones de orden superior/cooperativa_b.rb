# Una cooperativa es un conjunto de granjas sostenibles, usando RSpec, hacer una función de orden 
# superior mediante la cuál al realizar una combinación lineal usando sus huellas, sacamos el 
# nombre de la granja más sostenible

# Como RSpec trabaja bajo la metodologia TDD (Test Driven Development), vamos a crear primero los test
require 'sostenible'

describe Sostenible do
  before :all do
    @sostenible1 = Sostenible.new("Granja 1", [34, 54], ["Cerdo", "Mamifero", 90])
    @sostenible2 = Sostenible.new("Granja 2", [12, 43], ["Gallina", "Ave", 30])
    @sostenible3 = Sostenible.new("Granja 3", [65, 10], ["Oveja", "Mamifero", 100])
    @cooperativa = [@sostenible1, @sostenible2, @sostenible3]
  end

  it "max_sostenible" do
    expect(@sostenible1.max_sostenible(@cooperativa)).to eq("Granja 2")
  end
end

# Una vez creado la expectativa, creamos el codigo. Suponiendo que tenemos la siguiente clase:
class Sostenible 
  attr_reader :name, :footprints, :animals

  def initialize(name, footprints = [], animals = [])
    @name = name
    @footprints = footprints
    @animals = animals
  end

  def to_s
    return "#{@name}, #{@footprints}, #{@animals}"
  end

  def max_sostenible(cooperativa)
    return cooperativa.min_by { |x| x.footprints[0] + x.footprints[1] }.name
  end
end