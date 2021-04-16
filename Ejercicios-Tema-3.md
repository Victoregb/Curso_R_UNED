Ejercicios Tema 3
================

**Ejercicio 3.1.**  
*Podemos ahora generar tres números aleatorios con distribución normal
con media 100 y desviación típica 15. Para ello es útil consultar la
ayuda, ?rnorm.*

``` r
rnorm(3, 100, 15)
```

    ## [1]  86.61554 108.78327 117.56533

**Ejercicio 3.2.**  
*Definido el vector r a continuación, deduce la salida de las siguientes
líneas de código:*

``` r
r <- c(10, 20, 30, 40, 50, 60, 70, 80)

#r[2]
# 20

#r[1:5]
# 10, 20, 30, 40, 50

#r[]
#10, 20, 30, 40, 50, 60, 70, 80

#r[:]
#Ni idea, pues da error.

#r[1:]
#Tambien da error.

#r[:5]
#Error igual.

#r[2, 3]
#20,30 Nope, esto da error. Lo que tu decias es el ejercicio siguiente.

#r[c(2, 3)]
#20, 30

#r[-c(2, 3)]
#10, 40, 50, 60, 70, 80

#r[5:length(r)]
#50 60 70 80

#r[] <- c(2, 3); r
#2 3 2 3 2 3 2 3
```

**Ejercicio 3.3.**  
*Creamos el vector Id (con la identificación de cuatro pacientes: 103,
110, 156 y 212) y el vector edad (con las edades de los pacientes: 76,
45, 67 y 34).*  
*Después unimos ambos de forma que tengamos una columna por variable y
lo asignamos al objeto pac.*  
*¿De qué tipo y clase es el objeto obtenido?*

``` r
id <- c(103, 110, 156, 212)
edad <- c(76, 45, 67, 34)

(pac <- cbind(id,edad))
```

    ##       id edad
    ## [1,] 103   76
    ## [2,] 110   45
    ## [3,] 156   67
    ## [4,] 212   34

``` r
typeof(pac)
```

    ## [1] "double"

``` r
class(pac)
```

    ## [1] "matrix" "array"

**Ejercicio 3.4.**  
*Tenemos los nombres de los cuatro pacientes anteriores (Laura, Alberto,
Francisco, Berta). Podemos crear el data frame pacientes que contenga
los datos de pac más los nombres.*  
*¿De qué tipo y clase es el objeto obtenido?*

``` r
nombres <- c('Laura', 'Alberto', 'Francisco', 'Berta')

df <- data.frame(pac, nombres)
df
```

    ##    id edad   nombres
    ## 1 103   76     Laura
    ## 2 110   45   Alberto
    ## 3 156   67 Francisco
    ## 4 212   34     Berta

``` r
typeof(df)
```

    ## [1] "list"

``` r
class(df)
```

    ## [1] "data.frame"

**Ejercicio 3.5.**  
*A continuación se presentan una serie de definiciones y acciones. El
objetivo es predecir el resultado a obtener, atendiendo especialmente a
si las uniones son factibles o no y, en caso afirmativo, qué tipo de
resultado se obtiene.*

``` r
#dos <- c(100, 200); dos
#Asignamos el vector c(100, 200) a 'dos' y mostramos 'dos' 100 200

#tres <- c(10, 20, 30); tres
#Asignamos el vector c(10, 20, 30) a 'tres' y mostramos 'tres' 10 20 30

#cuatro <- c(1, 2, 3, 4); cuatro
#Asignamos el vector c(1, 2, 3, 4) a 'cuatro' y mostramos 'cuatro' 1 2 3 4

#dos + tres
#Da como resultado 110, 220, 30? Nope, recuerda que no se pueden sumar así
# si son de diferente longitud.

#cbind(dos, tres)
#100  10
#200  20
#100  30

#data.frame(dos, tres)
#100  10
#200  20
#Na   30?
#Nope, da error. Los vectores son de deferente longitud y no permite el reciclaje.

#cbind(dos, cuatro)
#100  1
#200  2
#100  3
#200  4

#data.frame(dos, cuatro)
#100  1
#200  2
#100  3
#200  4


#cbind(tres, cuatro)
#Error, vectores de distinta longitud y no permite el reciclaje. 

#data.frame(tres, cuatro)
#Error, vectores de distinta longitud y no permite el reciclaje. 

#cbind(dos, tres, cuatro)
#Funciona pero da un aviso. Se recicla entero el vector 'dos', pero
# sólo el primer elemento del vector 'tres'.


#data.frame(dos, tres, cuatro)
#Da error directamente.
```

**Ejercicio 3.6.**  
*Partimos del vector edad definido anteriormente. A partir de él podemos
obtener:*  
- *Un vector lógico donde se indique si el paciente tiene más de 50
años.*  
- *Las edades mayores de 50 años.*  
- *Los índices de los pacientes con más de 50 años.*  
- *Cuántos pacientes tienen más de 50 años.*

``` r
#recordemos: edad <- c(76, 45, 67, 34)
#Un vector lógico donde se indique si el paciente tiene más de 50 años.
(edad > 50)
```

    ## [1]  TRUE FALSE  TRUE FALSE

``` r
#Las edades mayores de 50 años.
#Del vector edad, aquellos elementos cuyo indices corresponde con los valores mayores de 50
(edad[which(edad > 50)])
```

    ## [1] 76 67

``` r
#Usando un indice de valores V, F
edad[edad > 50]
```

    ## [1] 76 67

``` r
#Los índices de los pacientes con más de 50 años.
#Parentesis cuando haces una asignación. 
which(edad > 50)
```

    ## [1] 1 3

``` r
#Cuántos pacientes tienen más de 50 años.
length(which(edad > 50))
```

    ## [1] 2

``` r
#Aquí sumamos los valores boleanos T=1 F=0, pero corremos cierto riesgo. 
sum(edad > 50)
```

    ## [1] 2

**Ejercicio 3.7.**  
\_Utilizaremos la función seq() para generar:\_\_ - *v1, un vector con
valores desde -3 hasta 3 a intervalos de 0.5* - *v2, un vector con
valores desde 3 hasta 0 a intervalos de 0.1* - *v3, un vector con 10
valores equiespaciados desde 13 hasta 130* - *v4, un vector con 3
valores separados por intervalos de 1/3 desde -9.67* - *v5, un vector de
la misma longitud que v1, con valores correlativos a partir de 1*

``` r
#v1, un vector con valores desde -3 hasta 3 a intervalos de 0.5
(v1 <- seq(-3, 3, 0.5))
```

    ##  [1] -3.0 -2.5 -2.0 -1.5 -1.0 -0.5  0.0  0.5  1.0  1.5  2.0  2.5  3.0

``` r
#v2, un vector con valores desde 3 hasta 0 a intervalos de 0.1
#Al ir hacia abajo, ¡el 'by' tienen que ser negativo!
(v2 <- seq(3, 0, -.1))
```

    ##  [1] 3.0 2.9 2.8 2.7 2.6 2.5 2.4 2.3 2.2 2.1 2.0 1.9 1.8 1.7 1.6 1.5 1.4 1.3 1.2
    ## [20] 1.1 1.0 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0

``` r
#v3, un vector con 10 valores equiespaciados desde 13 hasta 130
(v3 <- seq(13, 130, length.out=10))
```

    ##  [1]  13  26  39  52  65  78  91 104 117 130

``` r
#v4, un vector con 3 valores separados por intervalos de 1/3 desde -9.67
(v4 <- seq(from=-9.67, by= 1/3, length.out=3))
```

    ## [1] -9.670000 -9.336667 -9.003333

``` r
#v5, un vector de la misma longitud que v1, con valores correlativos a partir de 1
(v5 <- seq(along =v1))
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13

**Ejercicio 3.8.**  
*¿Qué tipo de comportamiento tendrá la función seq() si se utiliza el
argumento along.with únicamente? ¿Y si únicamente utilizamos length.out?
Aplíquese al siguiente código.*

``` r
seq(along.with = c(10, 20))
```

    ## [1] 1 2

``` r
seq(length.out=8)
```

    ## [1] 1 2 3 4 5 6 7 8

**Ejercicio 3.9.**  
*Ahora podemos combinar las funciones seq() y rep() para generar las
siguientes secuencias:*  
- 5 5 5 6 6 6 7 7 7 8 8 8 9 9 9  
- 0 0 2 2 4 4 6 6 8 8 10 10  
- 5 4 3 2 1 5 4 3 2 1 5 4 3 2 1

``` r
rep(seq(5,9), each=3)
```

    ##  [1] 5 5 5 6 6 6 7 7 7 8 8 8 9 9 9

``` r
rep(seq(0,10,2), each=2)
```

    ##  [1]  0  0  2  2  4  4  6  6  8  8 10 10

``` r
rep(seq(5,1), times=3)
```

    ##  [1] 5 4 3 2 1 5 4 3 2 1 5 4 3 2 1

**Ejercicio 3.10.**  
*A continuación se presentan una serie de definiciones y acciones. El
objetivo es predecir el resultado a obtener al ejecutar cada línea de
código, indicando en especial tipo y contenido del resultado obtenido.*

``` r
#vec <- seq(2, 12, length.out = 6)
#double 2, 4, 6, 8, 10, 12

#vec <- as.double(vec)
#No hay cambios

#vec[5] <- "a"
#Al añadir una letra pasa al tipo char. 2, 4, 6, 8, a, 12

#vec <- as.integer(vec)
#El 'a' dará problemas. 2, 4, 6, 8, NA, 12

#vec[5] <- T
#El 'T' dará problemas. 2, 4, 6, 8, 1, 12

#vec <- as.double(vec)


#vec <- vec/2
#Sigue siendo 'double', 1.0, 2.0, 3.0, 4.0, 0.5, 6.0

#as.logical(vec)
#No hay ceros, por lo que… todo Ts? Sip. TRUE TRUE TRUE TRUE TRUE TRUE

#as.logical(as.integer(vec))
#Como enteros, pero el quinto elemento es double, por lo que devuelve un 0. 0 es Falso
# por lo que el resueltado es TRUE  TRUE  TRUE  TRUE FALSE  TRUE
```

**Ejercicio 3.11.**  
*Si tenemos la cadena de caracteres ch &lt;- “1.7+3i”. ¿Qué resultado
podemos esperar obtener de aplicarle las siguientes funciones:
as.integer(), as.double() y as.complex()?*

``` r
ch <- "1.7+3i"
#as.integer() 
#No puede porque hay texto.

#as.double()
#También dará problemas por la misma razón. 

#as.complex()
#Evaluará el texto como un número complejo.
```
