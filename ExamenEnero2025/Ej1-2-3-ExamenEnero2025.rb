# Ejercicio 1: Hacer una clase de servicios que gestiona una empresa de gestión de 
#              servicios sanitarios que guarda los siguientes datos: un número identificador, 
#              un tipo de servicio (público o privado) y un conjunto de especialidades junto a su precio 
#              (las especialidades pueden ser: general, pediatria y geriatria)
class Servicio
  include Comparable

  attr_reader :id, :tipo, :especialidades

  def initialize(id, tipo, especialidades)
    # Validar ID (debe ser un número positivo)
    raise ArgumentError, "El ID debe ser un número entero positivo" unless id.is_a?(Integer) && id > 0

    # Validar tipo (debe ser "publico" o "privado")
    raise ArgumentError, "El tipo debe ser :publico o :privado" unless [:publico, :privado].include?(tipo)

    # Validar especialidades (debe ser un hash con claves símbolos y valores numéricos positivos)
    unless especialidades.is_a?(Hash) && especialidades.all? { |k, v| k.is_a?(Symbol) && v.is_a?(Numeric) && v > 0 }
      raise ArgumentError, "Las especialidades deben ser un hash con claves como símbolos y valores numéricos positivos"
    end

    @id = id
    @tipo = tipo
    @especialidades = especialidades
  end

  # Método to_s para representar el objeto como una cadena
  def to_s
    "Servicio ID: #{@id}, Tipo: #{@tipo}, Especialidades: #{@especialidades}"
  end

  # Implementación del operador <=> para comparar servicios por el número de especialidades
  def <=>(other)
    @especialidades.size <=> other.especialidades.size
  end
end

# Para los tests de Rspec mirar el otro fichero
# para ejecutar los tests de dicho fichero, usar en la terminal:
#     rspec TestsTDD-Ej1-Enero2025.rb

#Ejercicio 2: programacion funcional

# a) dado un conjunto de servicios, devuelva el servicio con mayor número de especialidades
def servicio_con_mas_especialidades(servicios)
  servicios.max
end

# b) un método que dado un conjunto de servicios y una especialidad, te devuelva cual es el servicio con menor precio en dicha especialidad
def servicio_con_menor_precio_en_especialidad(servicios, especialidad)
  servicios.select { |servicio| servicio.especialidades.key?(especialidad) }
           .min_by { |servicio| servicio.especialidades[especialidad] }
end

# c) Test unitarios para comprobar el correcto funcionamiento de los metodos
require 'test/unit'

class TestServicios < Test::Unit::TestCase
  def setup
    @servicio1 = Servicio.new(1, :publico, { geriatria: 80.0, pediatria: 60.0 })
    @servicio2 = Servicio.new(2, :privado, { geriatria: 100.0, general: 50.0 })
    @servicio3 = Servicio.new(3, :publico, { pediatria: 70.0, general: 40.0 })
    @servicios = [@servicio1, @servicio2, @servicio3]
  end

  def test_servicio_con_menor_precio_en_especialidad
    assert_equal(@servicio1, servicio_con_menor_precio_en_especialidad(@servicios, :geriatria), "El servicio con menor precio en geriatria debería ser @servicio1")
    assert_equal(@servicio1, servicio_con_menor_precio_en_especialidad(@servicios, :pediatria), "El servicio con menor precio en pediatria debería ser @servicio1")
    assert_equal(@servicio3, servicio_con_menor_precio_en_especialidad(@servicios, :general), "El servicio con menor precio en general debería ser @servicio3")
    assert_nil(servicio_con_menor_precio_en_especialidad(@servicios, :cardiologia), "Debería devolver nil si no hay servicios con la especialidad buscada")
  end

  def test_servicio_con_mas_especialidades
    assert_equal(@servicio1, servicio_con_mas_especialidades(@servicios), "El servicio con más especialidades debería ser @servicio1")
  end
end


# Ejercicio 3: Programacion concurrente con hilos
servicios = [
  Servicio.new(1, :publico, { geriatria: 80.0, pediatria: 60.0 }),
  Servicio.new(2, :privado, { geriatria: 100.0, general: 50.0 }),
  Servicio.new(3, :publico, { pediatria: 70.0, general: 40.0, geriatria: 40.0})
]

puts ""
puts "Introduzca la especialidad a hallar el porcentaje"

especialidad_a_calcular = gets.chomp.to_sym # lee la especialidad por terminal

# Hilo 1: Calcular el porcentaje de una especialidad en un conjunto de servicios
t1 = Thread.new do
  total_especialidades = servicios.sum { |servicio| servicio.especialidades.size }
  total_especialidad = servicios.count { |servicio| servicio.especialidades.key?(especialidad_a_calcular) }
  porcentaje = (total_especialidad.to_f / total_especialidades * 100).round(2)
  puts "Porcentaje de #{especialidad_a_calcular}: #{porcentaje}%"
end

# Hilo 2: Calcular el precio medio de una consulta entre un conjunto de servicios
t2 = Thread.new do
  total_precio = servicios.sum { |servicio| servicio.especialidades.values.sum }
  total_consultas = servicios.sum { |servicio| servicio.especialidades.size }
  precio_medio = (total_precio / total_consultas).round(2)
  puts "Precio medio de una consulta: #{precio_medio}€"
end

# Esperar a que ambos hilos terminen
t1.join
t2.joins