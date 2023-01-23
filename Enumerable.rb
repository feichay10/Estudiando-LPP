# Programa con los ejemplos del Modulo Enumerable en Ruby

# collect { |obj| block } → array
# collect → an_enumerator
# Retorna un nuevo array con el resultado de ejecutar el bloque en cada elemento.
# Si no se le pasa un bloque, se devuelve un enumerador.
# Aqui un ejemplo:
(1..4).collect { |i| i*i }      #=> [1, 4, 9, 16]
(1..4).collect { "cat"  }   #=> ["cat", "cat", "cat", "cat"]


# find(ifnone = nil) { |obj| block } → obj or nil
# find(ifnone = nil) → an_enumerator
# Pasa cada entrada en enum al bloque. Devuelve la primera para la cual el bloque no es falso. 
# Si no hay ningún objeto que coincida, llama a ifnone y devuelve su resultado cuando está especificado, 
# o devuelve nil de lo contrario.
#Si no se da ningún bloque, se devuelve un enumerador en su lugar.
# Aqui un ejemplo:
(1..10).find { |i| i % 5 == 0 and i % 7 == 0 }   #=> nil
(1..100).find { |i| i % 5 == 0 and i % 7 == 0 } #=> 35


# include?(obj) → true or false
# Devuelve true si cualquier miembro de enum es igual a obj. 
# Aqui un ejemplo:
(1..5).include?(3)   #=> true
(1..5).include?(6)   #=> false
(1..5).include?(3.0) #=> true


# map { |obj| block } → array
# map → an_enumerator
# Retorna un nuevo array con el resultado de ejecutar el bloque en cada elemento.
# Aqui un ejemplo:
(1..4).map { |i| i*i }      #=> [1, 4, 9, 16]
(1..4).map { "cat"  }   #=> ["cat", "cat", "cat", "cat"]


# max → obj
# max { |a, b| block } → obj
# max(n) → array
# max(n) { |a, b| block } → array
# Devuelve el objeto en enum con el valor máximo. El criterio para el valor máximo es determinado por 
# el bloque de comparación opcional. Si no se da ningún bloque, se comparan los elementos usando el operador <=>
# Aqui un ejemplo:
(5..10).max                                   #=> 10
(5..10).max { |a, b| a <=> b }                #=> 10
(5..10).max { |a, b| b <=> a }                #=> 5
(5..10).max(3)                                #=> [8, 9, 10]
(5..10).max(3) { |a, b| a <=> b }             #=> [8, 9, 10]
(5..10).max(3) { |a, b| b <=> a }             #=> [10, 9, 8]


# min → obj
# min { |a, b| block } → obj
# min(n) → array
# min(n) { |a, b| block } → array
# Devuelve el objeto en enum con el valor mínimo. El criterio para el valor mínimo es determinado por
# el bloque de comparación opcional. Si no se da ningún bloque, se comparan los elementos usando el operador <=>
# Aqui un ejemplo:
(5..10).min                                   #=> 5
(5..10).min { |a, b| a <=> b }                #=> 5
(5..10).min { |a, b| b <=> a }                #=> 10
(5..10).min(3)                                #=> [5, 6, 7]
(5..10).min(3) { |a, b| a <=> b }             #=> [5, 6, 7]
(5..10).min(3) { |a, b| b <=> a }             #=> [10, 9, 8]


# select { |obj| block } → array
# select → an_enumerator
# Devuelve un nuevo array que contiene todos los elementos de enum para los cuales el bloque no es falso.
# Si no se da ningún bloque, se devuelve un enumerador en su lugar.
# Aqui un ejemplo:
(1..10).select { |i|  i % 3 == 0 }   #=> [3, 6, 9]


# sort → array
# sort { |a, b| block } → array
# Devuelve un nuevo array ordenado por el valor de los elementos. El orden es determinado por el bloque de comparación opcional.
# Si no se da ningún bloque, se comparan los elementos usando el operador <=>
# Aqui un ejemplo:
(1..10).sort { |a, b| b <=> a }   #=> [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
(1..10).sort { |a, b| a <=> b }   #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]