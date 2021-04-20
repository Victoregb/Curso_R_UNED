Ejercicios Tema 6
================

**Ejercicio 6.1.** *Saber si un archivo es de texto o binario es fácil:
basta abrirlo con un editor de textos y, si podemos leer lo que aparece,
es de texto. Compruébalo con los archivos del directorio Ejercicios.*

``` r
#Abrimos el terminal y vamos a la carpeta :
# ~/Curso_R_UNED/Datos_y_Ejercicios/Ejercicios. (Vuestra ruta puede ser diferente.)
# Ver que archivos hay en la carpeta con ls
# Abrir los archivos con cat, por ejemplo cat opinion.sav
```

**Ejercicio 6.2.** *En la carpeta Ejercicios, abre el archivo
medidas.rda. Observa su contenido.*

``` r
#Cargamos los datos.
load('Datos_y_ejercicios/Ejercicios/medidas.rda')
source('atrib.R')

#Observamos las medidas
atrib(medidas)
```

    ## El nombre es:
    ## ---->[1] "Id"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  20
    ## * Su estructura es: 
    ##  int [1:20] 20 19 18 17 16 15 14 13 12 11 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "cond"
    ## 
    ## * Es de tipo:  character
    ## * Es de clase:  character
    ## * Es de longitud:  20
    ## * Su estructura es: 
    ##  chr [1:20] "B" "A" "B" "A" "B" "B" "A" "B" "B" "B" "A" "A" "B" "B" "A" "B" ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "med1"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  20
    ## * Su estructura es: 
    ##  int [1:20] 9 16 22 15 33 11 6 16 6 22 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "med2"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  20
    ## * Su estructura es: 
    ##  int [1:20] 19 27 24 14 28 32 24 21 18 34 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----

**Ejercicio 6.3.**  
*¿Es posible guardar un archivo de datos de R con una extensión que no
sea una de las dos indicadas: .rda y .RData?*

``` r
#Si que se puede, ya que lo determinas tu al guardarlo y 'el papel lo aguanta todo'
x <- c(1,2,3,4)
save(x, file = "Xdatos.ext_inventada")
#Limpiamos la zona de trabajo. 
rm(list=ls())
load('Xdatos.ext_inventada')
ls()
```

    ## [1] "x"

**Ejercicio 6.4.**  
*El archivo ‘Ejercicios/items.txt’ contiene la respuesta a cuatro ítems.
Impórtalo y almacena el resultado en items1.*

``` r
items1 <- read.table('Datos_y_ejercicios/Ejercicios/items.txt', header=T)
```

**Ejercicio 6.5.**  
*Uno de los formatos más utilizados en el almacenamiento de datos es el
csv, por su simplicidad. No obstante, en español los decimales se
codifican con una coma, y las hojas de cálculo, por ejemplo, los
traducen a csv separando mediante punto y coma, ‘;’. Es el caso del
archivo TR.csv, que contiene los tiempos de reacción de cada sujeto para
las dos medidas, y que proponemos importar de dos maneras distintas y
almacenar en el objeto tr.*

``` r
tr <- read.table("Datos_y_ejercicios/Ejercicios/TR.csv",
                 header = T, 
                 sep = ";",
                 dec = ",")
```

**Ejercicio 6.6.** *Hagamos ahora el ejercicio inverso: guardar items1
en un archivo, items1\_esp.csv, adaptado al entorno español.*

``` r
write.table(items1, "Datos_y_ejercicios/Ejercicios/items1_esp.csv",
            col.names = T, 
            sep = ";", 
            dec = ",", 
            quote = F)
```

**Ejercicio 6.7.** *Entre los archivos de datos del capítulo tenemos
algunos de hojas de cálculo. Impórtalos usando los paquetes apropiados.
Recuerda que, en caso de problemas, lo más eficiente es transformarlos
en archivos de texto.*

``` r
#instalamos el paquete necesario.
#install.packages("openxlsx")
items_xls <-  openxlsx::read.xlsx('Datos_y_ejercicios/Ejercicios/items.xlsx')

#instalamos el paquete necesario.
#install.packages("readODS")
items_ods <- readODS::read_ods('Datos_y_ejercicios/Ejercicios/items.ods')
```

**Ejercicio 6.8.**  
*Para finalizar el capítulo importaremos el archivo opinion.sav y, a
continuación, uniremos la información procedente de los diferentes
archivos en un único data frame, incluyendo otro archivo no tratado
hasta ahora: partic.txt, que contiene el sexo de los participantes.*

``` r
#Limpiamos el espacio de trabajo.
rm(list = ls())

#Cargamos todos los archivos que hemos usado hasta ahora.
load('Datos_y_ejercicios/Ejercicios/medidas.rda')
items1 <- read.table('Datos_y_ejercicios/Ejercicios/items.txt', header=T)
tr <- read.table("Datos_y_ejercicios/Ejercicios/TR.csv", header = T, sep = ";", dec = ",")
items_xls <-  openxlsx::read.xlsx('Datos_y_ejercicios/Ejercicios/items.xlsx')
items_ods <- readODS::read_ods('Datos_y_ejercicios/Ejercicios/items.ods')

#Y uno que no.
items_2 <- read.table("Datos_y_ejercicios/Ejercicios/partic.txt", header = T, stringsAsFactors = T)

#Instalamos el paquete que nos permitirá leer los archivos de SPSS
#install.packages("Hmisc")
opinion <- Hmisc::spss.get('Datos_y_ejercicios/Ejercicios/opinion.sav')
```

    ## re-encoding from latin-9

``` r
#Los empezamos a combinar
itms_xls_ods <- rbind(items_ods, items_xls)

prob <- merge(items_2, medidas, by = "Id")
prob <- merge(prob, opinion, by = "Id")
prob<- merge(prob, tr, by.x = "Id", by.y = "id")
prob<- merge(prob, items1, by.x = "Id", by.y = "id")
prob<- merge(prob, itms_xls_ods, by.x = "Id", by.y = "id")

source('atrib.R')
atrib(prob)
```

    ## El nombre es:
    ## ---->[1] "Id"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  int [1:18] 1 2 3 5 6 7 8 9 10 11 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "sexo"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  factor
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  Factor w/ 2 levels "hombre","mujer": 1 1 2 2 2 2 1 2 2 2 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## $levels
    ## [1] "hombre" "mujer" 
    ## 
    ## $class
    ## [1] "factor"
    ## 
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "cond"
    ## 
    ## * Es de tipo:  character
    ## * Es de clase:  character
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  chr [1:18] "A" "A" "B" "B" "A" "B" "B" "A" "A" "B" "B" "B" "A" "B" "B" "A" ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "med1"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  int [1:18] 30 33 17 18 15 20 18 29 9 22 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "med2"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  int [1:18] 29 28 13 19 8 18 11 16 33 34 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "opinion1"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  labelled factor
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  Factor w/ 3 levels "Baja","Media",..: 3 2 3 3 2 1 2 3 2 2 ...
    ##  - attr(*, "label")= Named chr "Valoración de la primera fase"
    ##   ..- attr(*, "names")= chr "opinion1"
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## $levels
    ## [1] "Baja"  "Media" "Alta" 
    ## 
    ## $class
    ## [1] "labelled" "factor"  
    ## 
    ## $label
    ##                        opinion1 
    ## "Valoración de la primera fase" 
    ## 
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "opinion2"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  labelled factor
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  Factor w/ 3 levels "Baja","Media",..: 1 2 1 1 2 3 3 1 1 3 ...
    ##  - attr(*, "label")= Named chr "Valoración de la segunda fase"
    ##   ..- attr(*, "names")= chr "opinion2"
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## $levels
    ## [1] "Baja"  "Media" "Alta" 
    ## 
    ## $class
    ## [1] "labelled" "factor"  
    ## 
    ## $label
    ##                        opinion2 
    ## "Valoración de la segunda fase" 
    ## 
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "tr1"
    ## 
    ## * Es de tipo:  double
    ## * Es de clase:  numeric
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  num [1:18] 0.907 0.866 1.316 0.962 0.756 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "tr2"
    ## 
    ## * Es de tipo:  double
    ## * Es de clase:  numeric
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  num [1:18] 1.504 1.236 0.888 1.183 1.367 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "it_1"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  int [1:18] 0 0 1 1 0 1 1 0 0 1 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "it_2"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  int [1:18] 1 1 0 1 0 0 0 0 0 1 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "it_3"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  int [1:18] 1 0 0 1 1 1 1 0 1 0 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "it_4"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  int [1:18] 0 0 1 1 0 0 0 1 0 0 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "it5"
    ## 
    ## * Es de tipo:  double
    ## * Es de clase:  numeric
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  num [1:18] 0 0 1 0 0 1 0 1 1 0 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "it6"
    ## 
    ## * Es de tipo:  double
    ## * Es de clase:  numeric
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  num [1:18] 0 0 0 1 0 1 1 0 0 0 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "it7"
    ## 
    ## * Es de tipo:  double
    ## * Es de clase:  numeric
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  num [1:18] 1 0 0 1 1 1 0 1 1 0 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
    ## 
    ## 
    ## 
    ## El nombre es:
    ## ---->[1] "it8"
    ## 
    ## * Es de tipo:  double
    ## * Es de clase:  numeric
    ## * Es de longitud:  18
    ## * Su estructura es: 
    ##  num [1:18] 0 1 0 1 0 1 1 0 1 0 ...
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----
