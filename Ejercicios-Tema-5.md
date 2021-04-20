Ejercicios Tema 5
================

**Ejercicio 5.1.**  
*Crea la lista L\_int, que contendrá dos vectores enteros.*

``` r
#Una lista simple.
(L_int <- list(seq(1,8), 4:12))
```

    ## [[1]]
    ## [1] 1 2 3 4 5 6 7 8
    ## 
    ## [[2]]
    ## [1]  4  5  6  7  8  9 10 11 12

**Ejercicio 5.2.**  
*Ahora podemos crear la lista L\_mix, que contendrá (1) un vector de
caracteres, (2) un factor y (3) la lista L\_int creada anteriormente.
Estudia las características de ambas listas.*

``` r
#Y además podemos darles nombres y todo, bueno esto lo pedirán en el ejercicio 5.6 
# pero así lo dejamos ya visto.
(L_mix <- list(Plantas=c('Hortensia', 'Geranio', 'Pensamiento'), 
               Prov=factor(c('CYL', 'PV', 'CAN', 'EXT', 'MAD')),
               L_int=L_int))
```

    ## $Plantas
    ## [1] "Hortensia"   "Geranio"     "Pensamiento"
    ## 
    ## $Prov
    ## [1] CYL PV  CAN EXT MAD
    ## Levels: CAN CYL EXT MAD PV
    ## 
    ## $L_int
    ## $L_int[[1]]
    ## [1] 1 2 3 4 5 6 7 8
    ## 
    ## $L_int[[2]]
    ## [1]  4  5  6  7  8  9 10 11 12

``` r
#Usamos la función que hemos creado para este fin. 
source('atrib.R')

atrib(L_mix)
```

    ## El nombre es:
    ## ---->[1] "Plantas"
    ## 
    ## * Es de tipo:  character
    ## * Es de clase:  character
    ## * Es de longitud:  3
    ## * Su estructura es: 
    ##  chr [1:3] "Hortensia" "Geranio" "Pensamiento"
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
    ## ---->[1] "Prov"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  factor
    ## * Es de longitud:  5
    ## * Su estructura es: 
    ##  Factor w/ 5 levels "CAN","CYL","EXT",..: 2 5 1 3 4
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## $levels
    ## [1] "CAN" "CYL" "EXT" "MAD" "PV" 
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
    ## ---->[1] "L_int"
    ## 
    ## * Es de tipo:  list
    ## * Es de clase:  list
    ## * Es de longitud:  2
    ## * Su estructura es: 
    ## List of 2
    ##  $ : int [1:8] 1 2 3 4 5 6 7 8
    ##  $ : int [1:9] 4 5 6 7 8 9 10 11 12
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----

**Ejercicio 5.3.**  
*En un ejemplo anterior hemos visto que una lista, que contenía otras
listas en su interior, era un objeto recursivo. ¿Es necesario que haya
una lista dentro de otra para que la segunda sea recursiva, o todas las
listas son objetos recursivos?*

``` r
#Podemos comprobar esto con la función is.recursive()

is.recursive(L_mix)
```

    ## [1] TRUE

``` r
#Y si la función esta vacía? También.
is.recursive(list())
```

    ## [1] TRUE

``` r
#Como podemos ver en la documentación la recursividad tiene que ver con la propia naturaleza del
# objeto lista.
help("is.recursive")
```

**Ejercicio 5.4.**  
*Podemos extraer el primer componente de la lista L\_int usando uno y
dos corchetes, y comprobar las diferencias.*

``` r
atrib(L_int[1])
```

    ## El nombre es:
    ## ---->NULL
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  8
    ## * Su estructura es: 
    ##  int [1:8] 1 2 3 4 5 6 7 8
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----

``` r
atrib(L_int[[1]])
```

    ## El nombre es:
    ## ---->NULL
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  integer
    ## * Es de longitud:  8
    ## * Su estructura es: 
    ##  int [1:8] 1 2 3 4 5 6 7 8
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## NULL
    ## 
    ## -----FIN-----

**Ejercicio 5.5.**  
*¿Qué ocurre si aplicamos el operador \[\[ a un vector atómico?*

``` r
x <- c(3,2,1)

x[[1]]
```

    ## [1] 3

``` r
x[1]
```

    ## [1] 3

``` r
#Podemos usar esta función para comprobar que realmente lo considera igual.
identical(x[[1]], x[1])
```

    ## [1] TRUE

**Ejercicio 5.6.**  
*Nombra los componentes de las listas de los ejercicios anteriores según
se indica: Vuelve a crear L\_int, pero ahora nombra sus componentes
usando int1 e int2. Para L\_mix usa el objeto ya creado y establece los
nombres char, fact y Lint.*

``` r
#Los podemos nombrar así:
L_int <- list(int1=seq(1,8), int2=4:12)

#O empleando la función names() cualquiera de las dos opciones es correcta.
names(L_mix) <- c('char', 'fact', 'Lint')
names(L_mix$Lint) <- c('int1', 'int2')


#Comprobamos como han cambiado los atributos.
atrib(L_mix)
```

    ## El nombre es:
    ## ---->[1] "char"
    ## 
    ## * Es de tipo:  character
    ## * Es de clase:  character
    ## * Es de longitud:  3
    ## * Su estructura es: 
    ##  chr [1:3] "Hortensia" "Geranio" "Pensamiento"
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
    ## ---->[1] "fact"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  factor
    ## * Es de longitud:  5
    ## * Su estructura es: 
    ##  Factor w/ 5 levels "CAN","CYL","EXT",..: 2 5 1 3 4
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## $levels
    ## [1] "CAN" "CYL" "EXT" "MAD" "PV" 
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
    ## ---->[1] "Lint"
    ## 
    ## * Es de tipo:  list
    ## * Es de clase:  list
    ## * Es de longitud:  2
    ## * Su estructura es: 
    ## List of 2
    ##  $ int1: int [1:8] 1 2 3 4 5 6 7 8
    ##  $ int2: int [1:9] 4 5 6 7 8 9 10 11 12
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## $names
    ## [1] "int1" "int2"
    ## 
    ## 
    ## -----FIN-----

**Ejercicio 5.7.**  
*Una lectura atenta habrá mostrado que al nombrar los componentes de las
listas hemos utilizado el operador de asignación igual, =, y no el de
asignación mediante una flecha, &lt;-.*  
*En su momento dijimos que ambos servían para hacer asignaciones, pero
que había algunas diferencias. ¿Puedes explorar uno y otro operador al
crear una lista? ¿Son ambos válidos; son equivalentes?*

``` r
prueba <- list(char=c(1,2,3),
               num <- 5,
               num_2 = num_2 <- 10)

#Como podemos ver no son lo mismo, mientras que con = indicamos asociación entr el nombre y el
# contenido, <- asigna el valor a num, creando la variable, pero no asociando la variable al 
# nombre. Podemos ver la diferencia cuando combinamos los dos en el tercer elemento.
prueba
```

    ## $char
    ## [1] 1 2 3
    ## 
    ## [[2]]
    ## [1] 5
    ## 
    ## $num_2
    ## [1] 10

**Ejercicio 5.8.**  
*A continuación se define la lista LST con varios componentes. Extrae
los elementos que se indican a continuación, a ser posible de más de una
manera.*

``` r
LST <- list(I = 1:6,
            M = matrix(1:12, 3),
            factor(c("T_completo", "T_parcial", "T_completo", "Baja"))
            )

# El primer componente de LST, esto es, el primer cajón.
LST[1]
```

    ## $I
    ## [1] 1 2 3 4 5 6

``` r
# El vector de enteros I.
LST$I
```

    ## [1] 1 2 3 4 5 6

``` r
# El tercer componente del vector I.
LST$I[3]
```

    ## [1] 3

``` r
# La segunda columna de la matriz M.
LST$M[,2]
```

    ## [1] 4 5 6

``` r
# La primera fila de la matriz M.
LST[[2]][1,]
```

    ## [1]  1  4  7 10

``` r
# La intersección de las dos peticiones anteriores.
LST[[2]][1,2]
```

    ## [1] 4

``` r
# El último componente de LST , esto es, el último cajón.
LST[3]
```

    ## [[1]]
    ## [1] T_completo T_parcial  T_completo Baja      
    ## Levels: Baja T_completo T_parcial

``` r
# El factor.
LST[[3]]
```

    ## [1] T_completo T_parcial  T_completo Baja      
    ## Levels: Baja T_completo T_parcial

``` r
#El número de datos del factor que corresponden a una "Baja".
sum(LST[[3]]=='Baja')
```

    ## [1] 1

**Ejercicio 5.9.**  
*Redefinimos la lista LST con nuevos componentes. Extrae los elementos
indicados, y de nuevo de más de una manera.*

``` r
LST <- list( L1 = list(L1_1 = c("No", "Sí"),
                       L1_2 = c(0, 1)),
             L2 = list(L2_1 = L2_1 <- c(6, 4, 1, 5, 2, 4, 3, 3),
                       L2_2 = LETTERS[L2_1])
             )
str(LST)
```

    ## List of 2
    ##  $ L1:List of 2
    ##   ..$ L1_1: chr [1:2] "No" "Sí"
    ##   ..$ L1_2: num [1:2] 0 1
    ##  $ L2:List of 2
    ##   ..$ L2_1: num [1:8] 6 4 1 5 2 4 3 3
    ##   ..$ L2_2: chr [1:8] "F" "D" "A" "E" ...

``` r
#El primer componente de LST, esto es, el primer cajón.
LST$L1
```

    ## $L1_1
    ## [1] "No" "Sí"
    ## 
    ## $L1_2
    ## [1] 0 1

``` r
#La lista L1.
LST[1]
```

    ## $L1
    ## $L1$L1_1
    ## [1] "No" "Sí"
    ## 
    ## $L1$L1_2
    ## [1] 0 1

``` r
#El vector L1_2.
LST$L1[2]
```

    ## $L1_2
    ## [1] 0 1

``` r
#El segundo elemento de L1_2.
LST$L1[[2]][2]
```

    ## [1] 1

``` r
#La cadena de caracteres "Sí".
LST$L1[[1]][2]
```

    ## [1] "Sí"

``` r
#La suma de los elementos de L2_1.
sum(LST$L2$L2_1)
```

    ## [1] 28

``` r
#Los elementos de L2_2 con posiciones impares en el alfabeto.

#Primero creamos un vector con los numeros impares del alfabeto.
#Vale, pregunta absurda. ¿Cuantas letras tiene el alfabeto? La respuesta para
# un castellanoparlante sería de 29... bueno, parece que 27 ya que ch y ll ya
# no las cuentan por ser dígrafos. En fin, el alfabeto de R no tiene Ñ por lo
# tanto 26 letras.
es_impar <- seq(1, 26,2)
LST$L2$L2_2[es_impar]
```

    ##  [1] "F" "A" "B" "C" NA  NA  NA  NA  NA  NA  NA  NA  NA

``` r
#¿Qué ocurriría si en la definición de L2_1 eliminamos el código L2_1 <-?
#Nos daría problemas ya que para crear el elemento L2_2 usamos 'L2_1' para decirle al
#programa donde tiene que buscar la información.
```

**Ejercicio 5.10.**  
*El trabajo con R requiere tratar con listas continuamente. Un ejemplo
son las opciones, que determinan multitud de aspectos de cómo se
comporta R en cálculos, resultados, etc.* *Podemos capturar las opciones
con una simple asignación como opt &lt;- options(). El resultado será
una lista cuyo tamaño dependerá de la configuración del sistema, de los
paquetes cargados, etc., pero de una longitud considerable. Hojea su
contenido y los valores establecidos.*

``` r
opt <- options()

names(opt)[1:6]
```

    ## [1] "add.smooth"        "bitmapType"        "browser"          
    ## [4] "browserNLdisabled" "CBoundsCheck"      "check.bounds"

**Ejercicio 5.11.**  
*Planteamos otro ejemplo con pacientes de un centro. Disponemos de la
siguiente tabla de datos, y hemos de construir un data frame, pac, con
sus datos.*

``` r
NIF <- c("11111111A", "22222222B", "33333333C", "44444444D", "55555555E", "66666666F")
Edad <- c(48, 35, 78, 31, 41, 55)


pac <-  data.frame(NIF,
                   Edad)
```

**Ejercicio 5.12.**  
*Vuelve a construir el data frame pac del primer ejercicio añadiendo
información sobre el apellido del paciente, el servicio del hospital que
lo atiende y un indicador del estado de cada uno. Los datos siguen el
mismo orden que el de los datos originales.*

``` r
Apellido <- c("Fernández", "Gómez", "González", "López", "Martínez", "Pérez")
Servicio <- c("neuro", "trauma", "digest", "trauma", "trauma", "digest")
Estado <- c("leve", "sano", "grave", "moderado", "grave", "leve")

pac['Apellido'] <- Apellido 
pac['Servicio'] <- Servicio
pac['Estado'] <- Estado

pac$Servicio <- factor(pac$Servicio)
pac$Estado <- ordered(pac$Estado, levels=c('sano', 'leve', 'moderado', 'grave'))

source('atrib.R')

atrib(pac)
```

    ## El nombre es:
    ## ---->[1] "NIF"
    ## 
    ## * Es de tipo:  character
    ## * Es de clase:  character
    ## * Es de longitud:  6
    ## * Su estructura es: 
    ##  chr [1:6] "11111111A" "22222222B" "33333333C" "44444444D" "55555555E" ...
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
    ## ---->[1] "Edad"
    ## 
    ## * Es de tipo:  double
    ## * Es de clase:  numeric
    ## * Es de longitud:  6
    ## * Su estructura es: 
    ##  num [1:6] 48 35 78 31 41 55
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
    ## ---->[1] "Apellido"
    ## 
    ## * Es de tipo:  character
    ## * Es de clase:  character
    ## * Es de longitud:  6
    ## * Su estructura es: 
    ##  chr [1:6] "Fernández" "Gómez" "González" "López" "Martínez" "Pérez"
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
    ## ---->[1] "Servicio"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  factor
    ## * Es de longitud:  6
    ## * Su estructura es: 
    ##  Factor w/ 3 levels "digest","neuro",..: 2 3 1 3 3 1
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## $levels
    ## [1] "digest" "neuro"  "trauma"
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
    ## ---->[1] "Estado"
    ## 
    ## * Es de tipo:  integer
    ## * Es de clase:  ordered factor
    ## * Es de longitud:  6
    ## * Su estructura es: 
    ##  Ord.factor w/ 4 levels "sano"<"leve"<..: 2 1 4 3 4 2
    ## 
    ## --------------
    ## 
    ## Sus atributos son: 
    ## $levels
    ## [1] "sano"     "leve"     "moderado" "grave"   
    ## 
    ## $class
    ## [1] "ordered" "factor" 
    ## 
    ## 
    ## -----FIN-----

**Ejercicio 5.13.**  
*Supongamos que queremos enviar los datos de pacientes de todo el
hospital para realizar una serie de análisis estadísticos. El objetivo
es conocer cuestiones como el número de pacientes, el tiempo medio de
estancia en los diferentes servicios, etc.*  
*En este caso, la persona responsable del archivo de datos no puede
enviar ese archivo tal como está: debe ser anonimizado para cumplir las
leyes de protección de datos.*  
*Para resolverlo, crearemos a partir del data frame pac otros dos:*  
*Uno llamado pac\_claves, que contendrá un código arbitrario para cada
paciente (basta con un vector de enteros consecutivos), su NIF y el
apellido.*  
*El otro archivo, llamado pac\_anon contendrá el código asignado a cada
usuario y el resto de la información. Es el que se enviará para realizar
los análisis.*

``` r
set.seed(1234)
claves <- sample.int(9999999, size=6)
pac['ID'] <- claves

pac_claves <- data.frame(pac[c('ID', 'NIF', 'Apellido' )])
  
pac_anon <- data.frame(pac[c(-1,-3)])
```

**Ejercicio 5.14.**  
*Supongamos ahora que necesitamos enviar al servicio de traumatología
los datos de sus pacientes.*  
*Partiremos del archivo anonimizado pac\_anon y crearemos el data frame
pac\_trauma.*  
*También se requiere un data frame con los pacientes graves, con el
nombre pac\_graves.*

``` r
#5 minutos sin entender por qué no funcionaba y es que se me había olvidado poner la ',' 
# detras de pac_anon$Servicio == 'trauma'
# En fin.
(pac_traum <- pac_anon[pac_anon$Servicio == 'trauma',])
```

    ##   Edad Servicio   Estado      ID
    ## 2   35   trauma     sano 6595564
    ## 4   31   trauma moderado 8684454
    ## 5   41   trauma    grave 9407364

``` r
(pac_graves <- pac_anon[pac_anon$Estado == 'grave', ])
```

    ##   Edad Servicio Estado      ID
    ## 3   78   digest  grave 7224201
    ## 5   41   trauma  grave 9407364

**Ejercicio 5.15.**  
*Debemos incluir ahora en el archivo pac original la variable Estancia,
que indica el número de días de estancia para cada paciente.*

``` r
Estancia <- c(16, 8, 46, 31, 22, 14)

#Usando $ es otra forma de declarar una nueva columna y asingarle nombre.
pac$Estancia <- Estancia
pac
```

    ##         NIF Edad  Apellido Servicio   Estado      ID Estancia
    ## 1 11111111A   48 Fernández    neuro     leve 1810256       16
    ## 2 22222222B   35     Gómez   trauma     sano 6595564        8
    ## 3 33333333C   78  González   digest    grave 7224201       46
    ## 4 44444444D   31     López   trauma moderado 8684454       31
    ## 5 55555555E   41  Martínez   trauma    grave 9407364       22
    ## 6 66666666F   55     Pérez   digest     leve 6417511       14

**Ejercicio 5.16.**  
*Tenemos los datos de dos pacientes nuevos que deben incluirse en el
archivo pac original. Los datos son:*

``` r
pac_nuevos <- data.frame(ID = c(7L, 8L),
                         NIF = c("77777777G", "88888888H"),
                         Edad = c(76, 61),
                         Apellido = c("Rodríguez", "Sánchez"),
                         Servicio = c("neuro", "digest"),
                         Estado = c("grave", "moderado"),
                         Estancia = c(2, 1)
                         )


#Estos datos los queremos añadir no como columnas, ya que eso son variables nuevas, 
# sino como nuevos sujetos, por lo tanto como filas nuevas ergo…

pac <- rbind(pac, pac_nuevos)
pac
```

    ##         NIF Edad  Apellido Servicio   Estado      ID Estancia
    ## 1 11111111A   48 Fernández    neuro     leve 1810256       16
    ## 2 22222222B   35     Gómez   trauma     sano 6595564        8
    ## 3 33333333C   78  González   digest    grave 7224201       46
    ## 4 44444444D   31     López   trauma moderado 8684454       31
    ## 5 55555555E   41  Martínez   trauma    grave 9407364       22
    ## 6 66666666F   55     Pérez   digest     leve 6417511       14
    ## 7 77777777G   76 Rodríguez    neuro    grave       7        2
    ## 8 88888888H   61   Sánchez   digest moderado       8        1

**Ejercicio 5.17.**  
*Supongamos que aplicamos dos tests, A y B, a un mismo grupo de
estudiantes en dos ocasiones. Como suele ocurrir, no todos estaban en la
primera aplicación y en la segunda. Los datos obtenidos se muestran a
continuación:*

``` r
test1 <- data.frame(Id = 1:4,
                    A1 = c(12, 14, 8, 13),
                    B1 = c(34, 41, 38, 40))
test2 <- data.frame(Id = c(1:3, 5),
                    A2 = c(14, 16, 8, 12),
                    B2 = c(39, 44, 36, 36)
                    )


#Une los datos en un solo data frame considerando:

#sólo los presentes en ambas mediciones,
test_ambos <- merge(test1,test2, by='Id')

#los participantes de la primera medida,
test_prim <- merge(test1, test2, all.x=T)

#los participantes de la segunda medida,
test_secun <- merge(test1, test2, all.y=T)

#todos los participantes.
test_all <- merge(test1, test2, all=T)
```

**Ejercicio 5.18.** *Infiere el resultado de las siguientes
expresiones.*

``` r
n <- c(1, NaN, Inf, -Inf)

#n * 2
#       2, NaN, Inf, -Inf

#n * 0
#       0, NaN, 0, 0 NOPE
#       2, NaN, NaN, NaN (BATMAN!)

#n / 0
#       Inf, NaN, Inf, -Inf

#n == NaN
#       NaN, NaN, NaN, NaN

#n == Inf
#       FALSE, NaN, True, FALSE

#is.finite(n)
#       TRUE, FALSE, FALSE, FALSE
```

**Ejercicio 5.19.**  
*Dado el data frame df construido a continuación, extrae los casos sin
datos perdidos y las variable sin datos perdidos.*

``` r
set.seed(1234)
m <- matrix(1:24, 4)
m[sample(1:24, 4)] <- NA
df <- data.frame(m); df
```

    ##   X1 X2 X3 X4 X5 X6
    ## 1  1 NA  9 13 17 21
    ## 2  2  6 10 14 18 NA
    ## 3  3  7 11 15 19 23
    ## 4  4  8 NA NA 20 24

``` r
#Podemos usar la función complete.cases para esto encontrar los casos (o filas) sin datos perdidos.
df[complete.cases(df), ]
```

    ##   X1 X2 X3 X4 X5 X6
    ## 3  3  7 11 15 19 23

``` r
#La respuesta a esta es un poco compleja si no se han visto las estructuras de control if y for.
#Creamos un contador para indicar en que columna estamos.
n <- 1

#Creamos un vector para almacenar las columnas donde se cumple x condición.
c <- c()

#Tenemos que realizar una comprobación en repetidas ocasiones a lo largo del df. 
# Para no repetir constantemente el codigo usamos un bucle, en este caso un for,
# para cada i en df (en este caso columnas):
for (i in df){
  
  #Un condicional y el ! indica negación. Por ende:
  # Si ninguno es NA entonces: Lo podemos leer como SI NO TRUE ENTONCES
  if (!any(is.na(i))){
    
    #Cumplida la condicion almacenamos la columna que nos interesa.
    c <- c(c,n)
  }
  
  #Si no se cumple la condición salta directamente aquí, y
  # añadimos uno al contador y volvemos a empezar hasta recorrer 
  # todo el data.frame.
  n <- n+1
}  
df[c]
```

    ##   X1 X5
    ## 1  1 17
    ## 2  2 18
    ## 3  3 19
    ## 4  4 20
