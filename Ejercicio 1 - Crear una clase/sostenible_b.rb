# Desarrolle con RSpec la clase Sostenible, que representa una granja sostenible. Debe tener un identificador que almacenará 
# el nombre de la granja, un conjunto de valores correspondientes a sus huellas (de carbono,  huella hídrica) y un conjunto 
# de animales (Identificador, tipo y precio). Describe la jerarquía de clases y estructura de directorio.

# Como RSpec está basado en expectativas, vamos a usar la metodología TDD (Test Driven Development) para realizar las expectativas.
# Esta metodología dice que primero hay que crear los test antes del código para desarrollar el menor codigo posible.

# La estructura del directirio es la siguiente:
# /Directorio_de_trabajo
#   |
#   |-- /lib
#   |     |-- sostenible.rb
#   |
#   |-- /spec
#   |     |-- sostenible_spec.rb
#   |     |-- spec_helper.rb
#   |
#   |-- Rakefile
#   |-- .rspec

# La jerarquia de clases es:
#
#                               BasicObject
#                                    |
#                                  Object
#                                    |
#        ____________________________|___________
#       |         |         |        |           |      
#     Symbol    String    Array   Numeric   Sostenible
#       |                              __________|__________
#       |                             |                     |
# TestSostenible                   Integer              Numeric


# 1º Creamos el fichero spec/sostenible_spec.rb. En el fichero añadimos la expectativa para comprobar si existe la clase y deberia fallar
require 'sostenible'

describe Sostenible do
  expect(Sostenible.new).not_to be nil
end
# Falla la expetactiva

# Creamos la clase en el directorio /lib, lib/sostenible.rb
class Sostenible
end
# Ahora supera la expectativa

# Cremos una expectativa para el identificador que almacenara el nombre de la granja
require 'sostenible'

describe Sostenible do
  expect(Sostenible.new).not_to be nil
  expect(Sostenible.new("Granja naibolo").name).to eq("Granja naibolo")
end
# Falla expectativa

# Inicializamos el atributo para almacenar el nombre de la granja
class Sostenible
  attr_reader :name

  def inialialize(name)
    @name = name
  end
end
# Ahora se supera la expectativa

# Creamos la expetativa para el conjunto de valores correspondientes a sus huellas (de carbono, huella hídrica)
require 'sostenible'

describe Sostenible do
  expect(Sostenible.new).not_to be nil
  expect(Sostenible.new("Granja naibolo").name).to eq("Granja naibolo")
  expect(Sostenible.new([1, 2]).footprints).to eq([1, 2])
end
# Falla expectativa

# Inicializamos el conjunto de huellas
class Sostenible
  attr_reader :name, :footprints = []

  def initialize(name, footprints = [])
    @name = name
    @footprint = footprints
  end
end
# Se supera la expectativa para el conjunto de huellas

# Creamos las expectativas para el conjunto de animales
require 'sostenible'

describre Sostenible do
  expect(Sostenible.new).not_to be nil
  expect(Sostenible.new("Granja naibolo").name).to eq("Granja naibolo")
  expect(Sostenible.new([1, 2]).footprint).to eq([1, 2])
  expect(Sostenible.new(["Cerdo", "Mamifero", 90]).animals).to eq(["Cerdo", "Mamifero", 90])
end
# Falla expectativa

# Inicializamos el conjunto de animales
class Sostenible
  attr_reader :name, :footprints = [], animals = []

  def inialialize(name, footprints = [], animals = [])
    @name = name
    @footprint = footprints
    @animals = animals
  end
end
# Se supera la expectativa

# Creamos una expectativa para el metodo to_s de la clase Sostenible
describe Sostenible do
  expect(Sostenible.new).not_to be(nil)
  expect(Sostenible.new("Granja naibolo").name).to eq("Granja naibolo")
  expect(Sostenible.new([1, 2]).footprints).to eq([1, 2])
  expect(Sostenible.new(["Cerdo", "Mamifero", 90]).animals).to eq(["Cerdo", "Mamifero", 90])
  
  granja = Sostenible.new("Granja naibolo", [1, 2], ["Cerdo", "Mamifero", 90])

  expect(granja.to_s).to eq("La Granja Naibolo con las huelas 1 2 con animales Cerdo de tipo Mamifero con precio de 90 euros")
end
# Falla expectativa

# Creamos en la clase Sostenible el metodo to_s
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
end
# Se supera la expectativa del metodo to_s