# Usando Unit Testing, utilizando programación funcional, realiza una función de orden superior
# para hallar el indicador de contaminación a través de los valores de las huellas.

def contaminacion(granja)
  if granja.footprints[0] < 50 and granja.footprints[1] < 50
    return 1
  else 
    return 2
  end
end

class TestContaminacion < Test::Unit::TestCase
  def setup 
    granja = [
      @granja1 = Granja.new(..., [1, 2]), 
      @granja2 = Granja.new(..., [5, 1]), 
      @granja3 = Granja.new(..., [3, 3])
    ]
  end

  def test_contaminacion
    assert_equal(contaminacion(@conjunto_granjas), 1)
  end
end