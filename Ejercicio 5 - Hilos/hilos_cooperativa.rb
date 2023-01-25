# Cooperativa de granjas que indican sus dos valores de huellas mediante
# hilos para hallar cada uno de sus valores

require 'thread'

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
end

mutex = Mutex.new

# Creamos un objeto de tipo Sostenible
granja1 = Sostenible.new("Granja Naikobo", [12, 13], ["Cerdo", "Mamifero", 345.5])
granja2 = Sostenible.new("Granja Naikobo", [45, 21], ["Cerdo", "Mamifero", 345.5])
granja3 = Sostenible.new("Granja Naikobo", [12, 13], ["Cerdo", "Mamifero", 345.5])
conjunto = [granja1, granja2, granja3]

threads = []
i = 0                         # Contador para el nombre de los hilos
conjunto.each do |granja|     # Recorrer el conjunto de granjas
  threads[i] = Thread.new do  # Crear un hilo por cada granja - 3 hilos --> 3 granjas como un push_back
    mutex.synchronize do      # Sincronizar el hilo
      puts "Huella: #{granja.footprints[0]}, #{granja.footprints[1]}\n"
    end
  end
  i += 1 # Incrementar el contador
end

threads.each do |thread| # Recorrer los hilos
  thread.join            # Esperar a que acaben los hilos 
end

# 1 Crear una clase o funcion polimorfica 
# 2 Funcion de orden superior o DSL
# 3 Hilos