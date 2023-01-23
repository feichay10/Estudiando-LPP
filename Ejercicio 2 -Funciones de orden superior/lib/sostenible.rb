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