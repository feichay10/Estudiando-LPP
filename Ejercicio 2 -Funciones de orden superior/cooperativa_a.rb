# Una cooperativa es un conjunto de granjas sostenibles, usando Unit Testing, hacer una función de orden superior
# mediante la cuál al realizar una combinación lineal usando sus huellas, sacamos el nombre de la granja más 
# sostenible. Describe la implementación y las variables que intervienen.

# Se entiende como combinacion lineal a la suma de los valores de las huellas 
# 1. Creamos el método max_sostenible para conseguir el nombre de la granja más sostenible
# 2. Creamos la prueba unitaria para comprobar el funcionamiento del método

# Suponiendo que la clase es la siguiente:
def max_sostenible(cooperativa)
  aux = cooperativa.collect { |granja| granja.footprints.reduce { |x, y| x + y}}.min
  cooperativa.find { |granja| sostenible.footprints.reduce { |x, y| x + y} == aux}.name
end

# Creamos los test:
class TestMaxSostenible < Test::Unit::TestCase
  @cooperativa = [@sostenible1, @sostenible2, @sostenible3]
  assert_equal("Nombre_granja_correcto", max_sostenible(@cooperativa))
end