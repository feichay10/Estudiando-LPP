require 'lib/sostenible'
require 'test/unit'

class TestSostenible < Test::Unit::TestCase
  def setup
    @granja_sostenible = Sostenible.new("Granja naibolo", [1, 2], ["Cerdo", "Mamifero", 90])
  end

  def test_incrementar
    assert_equal([2, 3], @granja_sostenible.incrementar([1, 2], 1))
  end
end