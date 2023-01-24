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
granja1 = Sostenible.new("123", [12, 13], ["Cerdo", "Mamifero", 345.5])
conjunto = [granja1, granja1, granja1]

threads = []
i = 0 # Contador para el nombre de los hilos
conjunto.each do |granja|
  threads[i] = Thread.new do
    mutex.synchronize do
      puts "Huella: #{granja.footprints[0]}, #{granja.footprints[1]}\n"
    end
  end
  i += 1
end

threads.each do |thread|
  thread.join
end