require 'sostenible'

describe Sostenible do
  before :all do
    @sostenible1 = Sostenible.new("Granja 1", [34, 54], ["Cerdo", "Mamifero", 90])
    @sostenible2 = Sostenible.new("Granja 2", [12, 43], ["Gallina", "Ave", 30])
    @sostenible3 = Sostenible.new("Granja 3", [65, 10], ["Oveja", "Mamifero", 100])
    @cooperativa = [@sostenible1, @sostenible2, @sostenible3]
  end

  it "max_sostenible" do
    expect(@sostenible1.max_sostenible(@cooperativa)).to eq("Granja 2")
  end
end