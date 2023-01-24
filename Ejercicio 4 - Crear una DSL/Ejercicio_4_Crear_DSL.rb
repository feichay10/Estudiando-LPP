# Realizar una DSL de granjas sostenibles con sus expectativas

# Creamos las expectativas
require 'dslsostenible'

describe DSLSostenible do
  expect(DSLSostenible.new).not_to be nil
end
# Falla expectativa

# Creamos la clase DSLSostenible
class DSLSostenible 
end
# Expectativa superada

# Creamos una expectativa para saber si la clase se puede instanciar
# Creacion de un objeto DSLSostenible
@sostenible_dsl = DSLSostenible.new(1234) do
  datos "Granja ESIT" , :carbono => 45, :hidrica => 30
  ejemplar "Vaca", :tipo => "Mamifero" , :precio => 345.5
end

expect(@sostenible_dsl).not_to eq(nil)

# Creamos el metodo initialize de la clase DSL Sostenible y pasa la expectativa
class DSLSostenible
  # Constructor de la clase
  def initializa(name, &block)
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
end

# Creamos las expectativas para comprobar que tiene el metodo datos
expect(@sostenible_dsl).to respond_to(:datos).to eq(true)
# Falla expectativa

# Añadimos el método datos 
def datos(name, options = {})
  dato = name
  dato << "Huella carbono: #{options[:carbono]}" if options[:carbono]
  dato << "Huella hidrica: #{options[:hidrica]}" if options[:hidrica]

  @datos << dato
end
# Pasa expectativa

# Ahora creamos la expectativa para el metodo ejemplar
expect(@sostenible_dsl).to respond_to(:ejemplar).to eq(true)
# Falla expectativa

# Ahora creamos el codigo del metodo ejemplar
def ejemplar(name, options = {})
  ejemplar = name
  ejemplar << "Tipo: #{options[:tipo]}" if options[:tipo]
  ejemplar << "Precion: #{options[:precio]}" if options[:precio]

  @ejemplares << ejemplar
end
# Supera la expectativa

# Creamos la expectativa para el metodo to_s
expect(@sostenible_dsl).to respond_to(:to_s).to eq(true)
# Falla expectativa

# Creamos el metodo to_s de la clase DSLSostenible
def to_s
  output = " "
  output << "La granja: #{@name}"
  output << "Datos: #{@datos}"
  output << "Ejemplares: #{@datos}"

  output
end

# Al final la clase queda de la siguiente manera:
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

  def datos(name, options = {})
    dato = name
    dato << "( #{options[:carbono]})" if options[:carbono]
    dato << "( #{options[:hidrica]})" if options[:hidrica]

    @datos << dato
  end

  def ejemplares(name, options = {})
    ejemplar = name
    ejemplar << "Tipo #{options[:tipo]}" if options[:tipo]
    ejemplar << "Precio #{options[:precio]}" if options[:precio]

    @ejemplares << ejemplar
  end

  def to_s
    output = " "
    output << "La granja: #{@name}"
    output << "Datos: #{@datos}"
    output << "Ejemplares: #{@ejemplares}"
  
    output
  end
end

# Las expectativas queda de la siguiente manera
describe DSLSostenible do
  before :all do
    @sostenible_dsl = DSLSostenible.new(1234) do
      datos "Granja ESIT", :carbono => 45, :hidrica => 30
      ejemplar "Vaca", :tipo => "Mamifero", :precio => 345.5
    end
  end

  expect(DSLSostenible.new).not_to be(nil)
  expect(@sostenible_dsl).not_to eq(nil)
  expect(@sostenible_dsl).to respond_to(:datos).to eq(true)
  expect(@sostenible_dsl).to respond_to(:ejemplares).to eq(true)
  expect(@sostenible_dsl).to respond_to(:to_s).to eq(true)
end