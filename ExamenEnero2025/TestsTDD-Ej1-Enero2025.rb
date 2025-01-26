require 'Ej1-2-3-ExamenEnero2025.rb'
require 'rspec'

describe Servicio do
  context 'Verificación inicial del entorno' do
    it 'verifica que el fichero de la clase exista' do
      expect(File).to exist('servicio.rb')
    end

    it 'devuelve nil al intentar crear un objeto vacío' do
      expect { Servicio.new }.to raise_error(ArgumentError)
    end
  end

  context 'Cuando se inicializa correctamente' do
    it 'crea un objeto con los atributos correctos' do
      servicio = Servicio.new(1, :publico, { geriatria: 80.0, pediatria: 60.0 })
      
      expect(servicio.id).to eq(1)
      expect(servicio.tipo).to eq("publico")
      expect(servicio.especialidades).to eq({ geriatria: 80.0, pediatria: 60.0 })
    end
  end

  context 'Validaciones del constructor' do
    it 'lanza un error si el ID no es un número entero positivo' do
      expect { Servicio.new(-1, :publico, { geriatria: 80.0 }) }.to raise_error(ArgumentError, /El tipo debe ser :publico o :privado/)
    end

    it 'lanza un error si las especialidades no son un hash válido' do
      expect { Servicio.new(1, "publico", "no_hash") }.to raise_error(ArgumentError, /Las especialidades deben ser un hash con claves como símbolos y valores numéricos positivos/)
      expect { Servicio.new(1, "publico", { "geriatria" => 80.0 }) }.to raise_error(ArgumentError, /Las especialidades deben ser un hash con claves como símbolos y valores numéricos positivos/)
      expect { Servicio.new(1, "publico", { geriatria: -80.0 }) }.to raise_error(ArgumentError, /Las especialidades deben ser un hash con claves como símbolos y valores numéricos positivos/)
    end
  end

  context 'Método to_s' do
    it 'devuelve una representación legible del objeto' do
      servicio = Servicio.new(1, "publico", { geriatria: 80.0, pediatria: 60.0 })
      expect(servicio.to_s).to eq("Servicio ID: 1, Tipo: publico, Especialidades: {:geriatria=>80.0, :pediatria=>60.0}")
    end
  end

  context 'Comparación entre servicios' do
    let(:servicio1) { Servicio.new(1, "publico", { geriatria: 80.0, pediatria: 60.0 }) }
    let(:servicio2) { Servicio.new(2, :privado, { general: 50.0 }) }
    let(:servicio3) { Servicio.new(3, "publico", { geriatria: 70.0, pediatria: 60.0, general: 50.0 }) }

    it 'compara correctamente dos servicios por el número de especialidades' do
      expect(servicio1 > servicio2).to eq(true)
      expect(servicio1 < servicio3).to eq(true)
      expect(servicio1 == servicio1).to eq(true)
    end
  end
end