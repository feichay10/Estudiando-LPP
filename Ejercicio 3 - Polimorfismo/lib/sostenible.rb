class Sostenible
  attr_reader :name, :footprints, :animals

  def inialialize(name, footprints = [], animals = [])
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