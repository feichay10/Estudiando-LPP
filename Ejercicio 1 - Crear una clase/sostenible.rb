# Desarrolle con Unit Testing la clase Sostenible, que representa una granja sostenible. 
# Debe tener un identificador que almacenará el nombre de la granja, un conjunto de valores 
# correspondientes a sus huellas (de carbono,  huella hídrica) y un conjunto de animales 
# (Identificador, tipo y precio). Describe la jerarquía de clases y estructura de directorio.


# Unit Test es una forma de comprobar que un fragmento de codigo funciona.
# Estructura de Directorio
#   |-- /lib
#   |     |-- sostenible.rb
#   |
#   |-- /tests
#         |-- granja_sostenible_test.rb

# La jerarquia de clases va desde Sostenible -> Object -> BasicObject

# Creamos la clase Sostenible en el directorio /lib
class Sostenible 
end

# Creamos las pruebas unitarias en el directorio /tests
# Creamos granja_sostenible_test.rb
require 'lib/sostenible'
require 'test/unit'

class SostenibleTest < Test::Unit::TestCase
  assert_not_equal(nil, Sostenible.new)
end
# Pasa test

# Añadimos el atributo que va a identificar la granja sostenible
class Sostenible
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

# Creamos un test para el atributo creado
class SostenibleTest < Test::Unit::TestCase
  assert_not_equal(nil, Sostenible.new)
  assert_equal("Granja naibolo", Sostenible.new("Granja naibolo"))
end
# Pasa test

# Añadimos el conjunto footprints
class Sostenible
  attr_reades :name, :footprints = []

  def initialize(name, footprints = [])
    @name = name
    @footprints = footprints
  end
end

# Creamos test para el conjunto creado
class SostenibleTest < Test::Unit::TestCase
  assert_not_equal(nil, Sostenible.new)
  assert_equal("Granja naibolo", Sostenible.new("Granja naibolo"))
  assert_equal(("Granja naibolo", [1, 2]), Sostenible.new("Granja naibolo", [1, 2]))
end
# Pasa test

# Añadimos el conjunto de animales
class Sostenible
  attr_reader :name, :footprints = [], :animals = []

  def initialize(name, footprints = [], animals = [])
    @name = name
    @footprints = footprints
    @animals = animals
  end
end

# Creamos test para el nuevo conjunto creado
class SostenibleTest < Test::Unit::TestCase
  assert_not_equal(nil, Sostenible.new)
  assert_equal("Granja naibolo", Sostenible.new("Granja naibolo"))
  assert_equal(("Granja naibolo", [1, 2]), Sostenible.new("Granja naibolo", [1, 2]))
  assert_equal(("Granja naibolo", [1,2], ["Cerdo", "Mamifero", 90]), Sostenible.new("Granja naibolo", [1, 2], ["Cerdo", "Mamifero", 90]))
end
# Pasa test