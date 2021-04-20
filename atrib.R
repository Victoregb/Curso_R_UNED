atrib <- function(variables){
  #Esta función es muy básica, se puede ir mejorando poco a poco con búcles.
  #Nueva actualización de la función, esta vez comprobaremos si es un vertor atómico,
  # por lo que lo evaluaremos en su totalidad o una lista, por lo que iremos 
  # elemento a elemento. 
  #
  #Primero crearemos la función comprobación.
  n <- 1
  
  comprobacion <- function(var){
    #Para ayudar a la legibilidad del output vamos a poner el nombre de la variable
    #al inicio. Para ello declaramos una variable n que actue de contador y recorra
    #la lista de nombres que devuelve la función names(), si de eso hablaba en el 
    #ejercicio anterior.
    cat('El nombre es:\n')
    cat('---->')
    print(names(variables[n]))
    cat('\n* Es de tipo: ',typeof(var))
    cat('\n* Es de clase: ', class(var))
    cat('\n* Es de longitud: ', length(var))
    cat('\n* Su estructura es: \n')
    str(var)
    cat('\n--------------\n')
    #Por la estructura que tiene lo que nos devuelve la función attributes() usar
    # cat() no es una opción así que lo dejaremos así. Se puede ver que cat() y print
    # se comportan de forma distinta.
    cat('\nSus atributos son: \n')
    print(attributes(var))
    cat('\n-----FIN-----\n\n\n\n')
  }
  
  #En caso de duda '\n' es nueva linea o golpe de carro. '\' es un símbolo especial o de escape y le
  #indica a (en este caso) cat() que el siguiente caracter es especial.
  #Iniciamos el bucle
  
  if (is.list(variables)==TRUE){
    for (var in variables){
      comprobacion(var)
      #Una vez terminado de imprimir añadimos uno a n para que en la siguiente iteración
      #se muestre el nombre de la siguiente variable.
      n <- n+1
    }
  }
  else {
    comprobacion(variables)
  }
  

}