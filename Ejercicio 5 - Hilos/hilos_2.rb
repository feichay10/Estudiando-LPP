# Con dos hilos escribir un código en Ruby en el que los restauradores puedan 
# poner y quitar toda su información de un escaparate*

require 'lib/restaurador'
require 'thread'

mutex = Mutex.new
CV = ConditionVariable.new      # Como un semaforo 
obj = Restaurador.new("123", :local, [["Cebolla", :primavera, 300, 2203, 1234]])
escaparate = []

a = Thread.new {
  mutex.synchronize {
    CV.wait(mutex)  # Espera a que se ponga algo en el escaparate
    puts "Retiro una hortaliza del escaparate"
    puts escaparate
    escaparate.pop 
  }
}

b = Thread.new {
  mutex.synchronize {
    puts "Pongo una hortaliza en el escaparate"
    escaparate << obj
    puts escaparate
    CV.signal # Despierta al hilo a
  }
}

a.join
b.join