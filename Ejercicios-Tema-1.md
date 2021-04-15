Ejercicios Tema 1
================

**Ejercicio 1.4**  
*Queremos calcular la circunferencia y área de un círculo de radio 1.8
metros. Recordemos que la circunferencia es dos pi veces el radio; el
área, por su parte, es pi veces el cuadrado del radio.* *Define y nombra
las variables adecuadamente y realiza los cálculos necesarios.*

``` r
#Un atajo para escribir el símbolo de asignación (<-) es alt + '-' 

radio  <- 1.8

circunferencia  <- 2 * pi * radio

area  <- pi * radio^2


# Parece que presentar así el resultado en el notebook hace que a cada salida de 
# resultados aparezca una celda nueva lo cual no es lo ideal a la hora de 
# presentar resultados. ¿Mejor emlpear otras estrategias? 
  
#print(circunferencia)
#print('La circunferencia es: ')
#print('El área de la circunferencia es: ')
#print(area)

#La solución que me parecía más simple era la de emplear '\n' para una nueva 
# linea, pero al final no ha sido 'tan simple'. Primero he necesesitado crear 
# una string con 'sprintf' para integrar la variable en la string. Emplear la
# la función 'paste' para unir ambas y usar como separador el '\n'.

resultado <- paste(sprintf('La circunferencia es: %s',area),
                   sprintf('El area es: %s', circunferencia), 
                   sep="\n")

#Por último, imprimimos el resultado con el formato deseado.
cat(resultado)
```

    ## La circunferencia es: 10.1787601976309
    ## El area es: 11.3097335529233

**Ejercicio 1.5**  
*Crea las funciones circunf() y circulo(), cada una con único argumento,
radio, y que devuelven la longitud de la circunferencia y el área de
círculo correspondientes, respectivamente. ¿Es posible crear la función
circ(), con un argumento (radio), que devuelva, simultáneamente, la
longitud y el áreas asociados?*

``` r
circunf <-function(radio){
  return( 2 * pi * radio)
}

circulo <- function(radio){
  return(pi * radio^2)
}

circ <- function(radio){
  #Creamos un vector para poder almacenar los datos
  v <- c()
  
  #Los vectores en R empiezan en 1 (en Python empiezan en 0)
  v[1] <- 2*pi*radio
  v[2] <- pi*radio^2
  
  #Tenemos dos opciones para devolver los resultados: uno en el que 
  # solo devolvemos el vector con las cifras. Descomentar este return
  # y comentar el siguiente para ver la diferencia.
  #return(v)
  resultado <- paste(sprintf('La circunferencia es: %s',v[1]),
                   sprintf('El area es: %s', v[2]), 
                   sep="\n")

  #Otro en el que lo devolvemos con contexto.
  #Por último, imprimimos el resultado con el formato deseado.
  return(cat(resultado))
  
}

circunf(radio)
```

    ## [1] 11.30973

``` r
circulo(radio)
```

    ## [1] 10.17876

``` r
circ(radio)
```

    ## La circunferencia es: 11.3097335529233
    ## El area es: 10.1787601976309

**Ejercicio 1.6**  
*Vamos a crear un pequeño programa y luego lo ejecutaremos. Para
ello:*  
*1. Abre un archivo nuevo (R Script) en RStudio.*  
*2. Escribe un comentario (con \#) al inicio indicando el nombre del
programa (programa\_1.R) y en la siguiente línea, su autor/a y fecha.*  
*3. A continuación crea un vector, v, de longitud 7 con números reales
en el intervalo \[0, 10\].*  
*4. Calcula la media del vector.*  
*5. Muéstrala por pantalla.*  
*6. Guarda el archivo con el nombre indicado anteriormente y
ciérralo.*  
*7. Comprueba que el archivo existe y está en el mismo directorio en que
estamos situados en R (podemos comprobarlo con getwd()).*  
*8. Ejecuta el programa.*

``` r
# programa_1.R
# autor:victoregb; 15/04/2021

#Paso 3: Crea un vector v, de longitud 7, intervalo [0,10]
#   v <- c(0,3,5, 7,9,1,10)

#El paso 4 y 5 lo resumimos en una sola linea.
#   print(mean(v))

# Esta celda la he copiado en un script de R y guardado para realizar este paso.
# Guardamos el archivo con el nombre 'programa_1.R'
# Comprobamos que esta con ¿¿getwd()?? La ayuda nos recomienda list.files y
# corroboramos que tenemos el programa.
source('programa_01.R')
```

    ## [1] 5

**Ejercicio 1.7**  
*Guarda el anterior vector v &lt;- c(9, -4, 3.14) en un archivo llamado
datos.RData. Comprueba la existencia del archivo en el directorio de
trabajo actual.*

``` r
v <- c(9, -4, 3.14)
save(v, file='datos.RData')
```

**Ejercicio 1.8**  
*Ahora vamos a construir otro programa, programa\_2.R, que leerá el
archivo de datos recién construido (datos.RData) y calculará y mostrará
la media. Para ello:*  
*Abre el archivo programa\_1.R en RStudio.*  
*Guárdalo con el nombre programa\_2.R.*  
*Cambia la línea donde se creaba el vector v por otra donde se lea el
archivo de datos datos.RData.* *Deja el resto del programa igual.*  
*Guarda el archivo y ciérralo.*  
*Comprueba que el archivo existe y está en el mismo directorio en que
estamos situados en R.*  
*Ejecuta el programa.*

``` r
# El contenido de programa_02.R quedaría así:
#   data <- load("~/Curso_R/datos.Rdata")
#   media <- mean(v)
#   cat("La media es: ", media)

source('programa_02.R')
```

    ## La media es:  2.713333

**Ejercicio 1.9**  
*Por último, modificaremos el vector v, lo volveremos a grabar en
datos.RData y ejecutaremos de nuevo programa\_2.R. Por último, deberemos
comprobar que el resultado de la ejecución se ajusta al nuevo vector.*

``` r
v <- c(0,3,5, 7,9,1,10)

save(v, file='datos.RData')

source('programa_02.R')
```

    ## La media es:  5

``` r
#Confirmamos que la media se ajusta al nuevo vector.
```

**Ejercicio 1.10**  
*Los vectores x &lt;- c(2, 1, 5, 2, 4) e y &lt;- c(1, 1, 4, 3, 4)
contienen información ordinal. Queremos conocer una medida de su
relación a través de la correlación policórica.*  
*Comprueba si R dispone de alguna función que responda a nuestra
necesidad; en caso contrario, localiza algún paquete que sí permita el
cálculo, instálalo y llévalo a cabo.*

``` r
x <- c(2, 1, 5, 2, 4)
y <- c(1, 1, 4, 3, 4)

#Buscamos en internet un paquete para poder realizar correlaciones policóricas.
#Quitar la almohadilla para ejecutar la linea de instalación del paquete.
#install.packages("polycor")
library("polycor")
polychor(x,y)
```

    ## Warning in optimise(f, interval = c(-maxcor, maxcor)): NA/Inf replaced by
    ## maximum positive value

    ## Warning in optimise(f, interval = c(-maxcor, maxcor)): NA/Inf replaced by
    ## maximum positive value

    ## Warning in optimise(f, interval = c(-maxcor, maxcor)): NA/Inf replaced by
    ## maximum positive value

    ## [1] 0.9970999

**Ejercicio 1.11**  
*¿Cómo obtener una media recortada?* *Una búsqueda en la ayuda (?trimmed
mean) no dice nada, y usar la doble interrogación tampoco ayuda mucho.
Una búsqueda en Internet puede ayudar, y también explorar la ayuda de
mean().*

``` r
mean(v, trim = 0.05)
```

    ## [1] 5
