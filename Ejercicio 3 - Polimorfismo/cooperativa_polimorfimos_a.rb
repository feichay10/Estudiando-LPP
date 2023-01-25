# Una cooperativa es un conjunto de granjas sostenibles, usando Unit Testing, con el uso de 
# polimorfismo, incrementar el precio de compra de tal forma que el factor es la diferencia 
# entre huellas. Describe la implementación y las variables que intervienen. 
class Sostenible
  attr_reader :name, :footprints, :animals

  def inialialize(name, footprints, animals)
    @name = name
    @footprints = footprints
    @animals = animals
  end

  def to_s
    return "La #{@name} con las huellas #{@footprints} con animales #{@animals[0]} de tipo #{@animals[1]} con precio de #{@animals[2]} euros"
  end

  def incrementar(conjunto, factor)
    conjunto.collect{ |c| c + factor }
  end

  def +(other)
    Sostenible.new("Granja naibolo", [1, 2], ["Cerdo", "Mamifero", 90] + other)
  end
end

# Creamos un test para el metodo incrementar
class TestSostenible < Test::Unit::TestCase
  def setup
    @granja_sostenible = Sostenible.new("Granja naibolo", [1, 2], ["Cerdo", "Mamifero", 90])
  end

  def test_incrementar
    assert_equal([2, 3], @granja_sostenible.incrementar([1, 2], 1))
  end
end