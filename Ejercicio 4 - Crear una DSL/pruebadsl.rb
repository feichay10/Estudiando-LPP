class DSLSostenible
  def initialize(name, &block)
    @name = name
    @datos = []
    @ejemplares = []

    if block_given?
      if block.arity == 1
        yield self
      else
        instance_eval(&block)
      end
    end
  end

  def to_s
    output = ""
    output << "La granja: #{@name}\n"
    output << "Datos: #{@datos}\n"
    output << "Ejemplares: #{@ejemplares}\n"
  
    output
  end

  def datos(name, options = {})
    dato = name
    dato << "( #{options[:carbono]})" if options[:carbono]
    dato << "( #{options[:hidrica]})" if options[:hidrica]

    @datos << dato
  end

  def ejemplares(name, options = {})
    ejemplar = name
    ejemplar << "Tipo: #{options[:tipo]}" if options[:tipo]
    ejemplar << " Precio: #{options[:precio]}" if options[:precio]

    @ejemplares << ejemplar
  end
end

sostenible_dsl = DSLSostenible.new("Granja 1") do
  datos "Granja ESIT", :carbono => 45, :hidrica => 30
  ejemplares "Vaca ", :tipo => "Mamifero", :precio => 345.5
end

puts sostenible_dsl