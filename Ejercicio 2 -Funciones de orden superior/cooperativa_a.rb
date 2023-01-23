# Una cooperativa es un conjunto de granjas sostenibles, usando Unit Testing, hacer una función de orden superior
# mediante la cuál al realizar una combinación lineal usando sus huellas, sacamos el nombre de la granja más 
# sostenible. Describe la implementación y las variables que intervienen.

# Se entiende como combinacion lineal a la suma de los valores de las huellas 
# 1. Creamos el método max_sostenible para conseguir el nombre de la granja más sostenible
# 2. Creamos la prueba unitaria para comprobar el funcionamiento del método

# Suponiendo que la clase es la siguiente:
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

# Creamos los test:
require 'sostenible'

class TestMaxSostenible < Test::Unit::TestCase
  def setup
    @sostenible1 = Sostenible.new("Granja 1", [34, 54], ["Cerdo", "Mamifero", 90])
    @sostenible2 = Sostenible.new("Granja 2", [12, 43], ["Gallina", "Ave", 30])
    @sostenible3 = Sostenible.new("Granja 3", [65, 10], ["Oveja", "Mamifero", 100])
    @cooperativa = [@sostenible1, @sostenible2, @sostenible3]
  end

  def test_max_sostenible
    assert_equal("Nombre_granja_correcto", max_sostenible(@cooperativa))
  end
end

# Para conseguir el nombre de la granja más sostenible primero realizamos un collect, combinado con un reduce para 
# de esta manera conseguir un array con la combinación lineal de cada granja y cogemos la de valor mínimo. Con este 
# valor hacemos un find para encontrar la granja que tenga el mismo valor y conseguir el nombre de la misma. 
# Intervienen variables de instancia y variables locales.