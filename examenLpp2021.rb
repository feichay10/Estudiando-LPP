#############################################################################################
####################################### Pregunta 1 ##########################################
# Desarrolle con RSpec la clase Productor que representa a una empresa agrícola. Ha de
# contar con un identificador que almacenará el nombre de la empresa, un conjunto de cultivos
# que almacenará la siguiente información para cada cultivo (nombre, superficie, temporada),
# y un conjunto que almacenará los dos valores que multiplicados dan el volumen de ventas
# de la empresa (total_productos_vendidos, precio_unitario_venta).
#############################################################################################


# Este desarrollo, utilizando la herramienta RSpec, se hará mediante la metodología TDD
# (Test Driven Development), con lo cual debemos primero escribir los tests individuales 
# para las funcionalidades que queramos implementar, dando éstos como fallidos:

# Test Clase Productor
Rspec.describe Productor do
  describe Productor do
    before :all do
      @productor1 = Productor.new("Fabio Bianchini", [["Pera", 12, "Primavera"]], [15, 3])
    end
    it "Debe existir una clase para identificar a un productor" do
      expect(Productor).not_to eq(nil)
    end
  end
end

# Luego escribimos el código para hacer que el test escrito previamente pueda pasar:

# Creación Clase Productor
class Productor 
  
end


# Y una vez pase el test optimizamos el código escrito, si es necesario, y pasamos al resto de 
# tests:

# Test Nombre Productor
it "El productor contiene un atributo en el que almacenar el nombre de la empresa" do
  expect(@productor1.nombre).to eq("Fabio Bianchini")
end

# Implementación Nombre Productor
class Productor 
  attr_accessor :nombre, :cultivos, :ventas
  
  def initialize (nombre, cultivos, ventas) 
    @nombre = nombre
  end
end


# Test Cultivos 
it "Existe un conjunto de cultivos por cada productor" do
  expect(@productor1.cultivos.instance_of? Array).to eq(true)
end
it "Cada cultivo contiene 3 campos a rellenar" do
  expect(@productor1.cultivos[0].lenght).to eq(3)
end
it "Cada cultivo contiene un nombre" do
  expect(@productor1.cultivos[0][0].instance_of? String).to eq(true)
end
it "Cada cultivo contiene una superficie" do
  expect(@productor1.cultivos[0][1].instance_of? Integer).to eq(true)
end
it "Cada cultivo contiene una temporada" do
  expect(@productor1.cultivos[0][2].instance_of? String).to eq(true)
end

# Implementación Cultivos
class Productor 
  include Enumerable
  attr_accessor :nombre, :cultivos
  
  def initialize (nombre, cultivos, ventas) 
    @nombre = nombre
    @cultivos = cultivos
  end
end

# Test volumen de ventas
it "Existe un conjunto que define el volumen de ventas del productor" do
  expect(@productor1.ventas.instance_of? Array).to eq(true)
end
it "El volumen de ventas contiene 2 campos a rellenar" do
  expect(@productor1.ventas.length).to eq(2)
end
it "Ambos son enteros" do
  expect(@productor1.ventas[0].instance_of? Integer).to eq(true)
  expect(@productor1.ventas[1].instance_of? Integer).to eq(true)
end
it "Multiplicados dan el volumen de ventas" do
  expect(@productor1.volumen_ventas).to eq(45)
end

# Implementación Volumen de ventas
class Productor 
  include Enumerable
  attr_accessor :nombre, :cultivos, :ventas
  
  def initialize (nombre, cultivos, ventas) 
    @nombre = nombre
    @cultivos = cultivos
    @ventas = ventas
  end

  def volumen_ventas 
    @ventas[0] * @ventas[1]
  end
end




#############################################################################################
####################################### Pregunta 2 ##########################################
# Una cooperativa está compuesta por un conjunto de productores. Usando programación
# funcional, escriba el código Ruby de una función de orden superior para calcular el valor
# mínimo del volumen de ventas de los productores que forman parte una cooperativa.
# Describa su implementación.
# Escriba una prueba unitaria para comprobar el correcto funcionamiento del método para
# calcular el valor mínimo del volumen de ventas que ha desarrollado. ¿Dónde se ha de
# almacenar el código fuente de la prueba?
#############################################################################################

# Código

def minVolume (arrProds)
  arrProds.collect { |pr| pr.volumen}.min
end

# Esta función cumple con el paradigma de programación funcional puesto que ni modifica ninguna 
# variable ya declarada (haciendo de ella misma, una función pura). Ni utiliza ningún método de 
# control de la ejecución como bucles o condiciones, propios de la programación imperativa. Sino 
# que hace uso de funciones del módulo Enumerable (collect, min) perteneciente a Ruby. 


# Prueba Unitaria

class TestCoop < Test::Unit::TestCase

  def setup 
    cooperativa = [
      Productor.new(..., [1, 2]), 
      Productor.new(..., [5, 1]), 
      Productor.new(..., [3, 3])
    ]
  end

  def test_min_volume
    assert_equal(minVolume(@cooperativa), 2)
  end

end


#############################################################################################
####################################### Pregunta 3 ##########################################
# Escriba la expectativa y el código Ruby de una función de orden superior que
# permita incrementar en un factor el precio_unitario_venta, del volumen de ventas,
# de los productores de una cooperativa usando programación funcional. Describa su
# implementación.
#############################################################################################


# Prueba Unitaria
class TestCoop < Test::Unit::TestCase
  def setup 
    cooperativa = [
      Productor.new(..., [1, 2]), 
      Productor.new(..., [5, 1]), 
      Productor.new(..., [3, 3])
    ]
  end

  def test_factor_price
    assert_equal(factorPrice(@cooperativa, 4), [arrProds [
      [1, 8]
      [5, 4]
      [3, 12]
    ]])
  end
end


# Implementación
def factorPrice (cooperativa, factor)
  newArr = cooperativa.collect { |pr|
    # Precio unitario = productor.ventas[1]
    Productor.new(pr.nombre, pr.cultivos, [pr.ventas[0], pr.ventas[1] * factor]) 
  }
end



# #############################################################################################
####################################### Pregunta 4 ##########################################
# Escriba la expectativa y el código Ruby de una función de orden superior que permita
# calcular la superficie total de cultivo de los productores de una cooperativa usando
# programación funcional. Describa su implementación.
#############################################################################################

def totalSurface (coop)
  coop.sum { |pr|
    pr.cultivos.collect { |c|
      c[1]
    }
  }
end


# prueba
class TestCoop < Test::Unit::TestCase
  def setup 
    cooperativa = [
      Productor.new(... ["pera", 23, primavera], [1, 2]), 
      Productor.new(... ["pera", 23, primavera], [5, 1]), 
      Productor.new(... ["pera", 23, primavera], [3, 3])
    ]
  end

  def test_total_surface
    assert_equal(totalSurface(coop), 69)
  end
end



# #############################################################################################
####################################### Pregunta 5 ##########################################
# En un mercadillo, un agricultor cosecha un producto y lo pone en un expositor. Un
# empleado recoge el producto del expositor y lo lleva al mostrador del cliente. Escriba el
# código Ruby que permita a dos hilos poner y retirar productos del expositor Describa su
# implementación.
#############################################################################################


lock = Mutex.new
@expositor = []
@mostrador = []
empleado = ConditionVariable.new
cliente = ConditionVariable.new


def ponerExpositor (prod)
	puts("Pone " + prod + " en " + "Expositor")
	@expositor << prod
end

def quitarExpositor (prod) 
	puts("Quita " + prod + " de " + "Expositor")
	@expositor.delete(prod)
end

def ponerMostrador (prod)
	puts("Pone " + prod + " en " + "Mostrador")
	@mostrador << prod
end

def quitarMostrador (prod) 
	puts("Quita " + prod + " de " + "Mostrador")
	@mostrador.delete(prod)
end
threadAgrigultor = Thread.new do
	lock.synchronize do
		ponerExpositor("Semilla")
		empleado.signal
	end
end

threadEmpleado = Thread.new do
	lock.synchronize do
		empleado.wait(lock)
		quitarExpositor("Semilla")
		ponerMostrador("Semilla")
		cliente.signal
	end
end

threadCliente = Thread.new do
	lock.synchronize do
		cliente.wait(lock)
		quitarMostrador("Semilla")
	end
end

threadAgrigultor.join
threadEmpleado.join
threadCliente.join