atrib <- function(variables){
  #Para ayudar a la legibilidad del output vamos a poner el nombre de la variable
  #al inicio. Para ello declaramos una variable n que actue de contador y recorra
  #la lista de nombres que devuelve la función names(), si de eso hablaba en el 
  #ejercicio anterior.
  n <- 1
  
  #En caso de duda '\n' es nueva linea o golpe de carro. '\' es un simbolo especial o de escape y le
  #indica a (en este caso) cat() que el siguiente caracter es especial.
  #Iniciamos el bucle
  for (var in variables){
    print(names(variables[n]))
    cat('\nEs de tipo: ',typeof(var))
    cat('\nEs de clase: ', class(var))
    cat('\nEs de longitud: ', length(var))
    #Por la estructura que tiene lo que nos devuelve la función attributes() usar
    # cat() no es una opción así que lo dejaremos así. Se puede ver que cat() y print
    # se comportan de forma distinta.
    cat('\nSus atributos son: \n')
    print(attributes(var))
    cat('\n')
    #Una vez terminado de implimir añadimos uno a n para que en la siguiente iteración
    #se imprima el nombre de la siguiente variable.
    n <- n+1
  }
}