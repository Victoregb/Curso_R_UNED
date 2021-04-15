<div class="container-fluid main-container">

<div id="header">

<div class="btn-group pull-right float-right"><button type="button" class="btn btn-default btn-xs btn-secondary btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span>Code</span><span class="caret"></span></button>

*   [Show All Code](#)
*   [Hide All Code](#)

*   [Download Rmd](#)

</div>

# Ejercicios Tema 1

</div>

**Ejercicio 1.4.** _Queremos calcular la circunferencia y área de un círculo de radio 1.8 metros. Recordemos que la circunferencia es dos pi veces el radio; el área, por su parte, es pi veces el cuadrado del radio._ _Define y nombra las variables adecuadamente y realiza los cálculos necesarios._

    #Un atajo para escribir el símbolo de asignación (<-) es alt + '-' 

    radio  <- 1.8

    circunferencia  <- 2 * pi * radio
    area  <- pi * radio^2

    # Parece que presentar así el resultado hace que a cada salida de resultados
    #  aparezca una celda nueva lo cual no es lo ideal a la hora de presentar 
    #  resultados. Mejor emlpear otras estrategias. 

    #print(circunferencia)
    #print('La circunferencia es: ')
    #print('El área de la circunferencia es: ')
    #print(area)

    #La solución que me parecía más simple era la de hacer 
    resultado <- paste(sprintf('La circunferencia es: %s',area),
                       sprintf('El area es: %s', circunferencia), 
                       sep="\n")
    cat(resultado)

    La circunferencia es: 10.1787601976309
    El area es: 11.3097335529233

**Ejercicio 1.5.** _Crea las funciones circunf() y circulo(), cada una con único argumento, radio, y que devuelven la longitud de la circunferencia y el área de círculo correspondientes, respectivamente. ¿Es posible crear la función circ(), con un argumento (radio), que devuelva, simultáneamente, la longitud y el áreas asociados?_

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

    [1] 11.30973

    circulo(radio)

    [1] 10.17876

    circ(radio)

    La circunferencia es: 11.3097335529233
    El area es: 10.1787601976309

**Ejercicio 1.6.** _Vamos a crear un pequeño programa y luego lo ejecutaremos. Para ello:_  
_1\. Abre un archivo nuevo (R Script) en RStudio._  
_2\. Escribe un comentario (con #) al inicio indicando el nombre del programa (programa_1.R) y en la siguiente línea, su autor/a y fecha._  
_3\. A continuación crea un vector, v, de longitud 7 con números reales en el intervalo [0, 10]._  
_4\. Calcula la media del vector._  
_5\. Muéstrala por pantalla._  
_6\. Guarda el archivo con el nombre indicado anteriormente y ciérralo._  
_7\. Comprueba que el archivo existe y está en el mismo directorio en que estamos situados en R (podemos comprobarlo con getwd())._  
_8\. Ejecuta el programa._

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

    [1] 5

**Ejercicio 1.7.** _Guarda el anterior vector v <- c(9, -4, 3.14) en un archivo llamado datos.RData. Comprueba la existencia del archivo en el directorio de trabajo actual._

    v <- c(9, -4, 3.14)
    save(v, file='datos.RData')

**Ejercicio 1.8.** _Ahora vamos a construir otro programa, programa_2.R, que leerá el archivo de datos recién construido (datos.RData) y calculará y mostrará la media. Para ello:_  
_Abre el archivo programa_1.R en RStudio._  
_Guárdalo con el nombre programa_2.R._  
_Cambia la línea donde se creaba el vector v por otra donde se lea el archivo de datos datos.RData._ _Deja el resto del programa igual._  
_Guarda el archivo y ciérralo._  
_Comprueba que el archivo existe y está en el mismo directorio en que estamos situados en R._  
_Ejecuta el programa._

    #El contenido de programa_02.R quedaria así:

    #   data <- load("~/Curso_R/datos.Rdata")
    #   media <- mean(v)
    #   cat("La media es: ", media)

    source('programa_02.R')

    La media es:  2.713333

**Ejercicio 1.9.** _Por último, modificaremos el vector v, lo volveremos a grabar en datos.RData y ejecutaremos de nuevo programa_2.R. Por último, deberemos comprobar que el resultado de la ejecución se ajusta al nuevo vector._

    v <- c(0,3,5, 7,9,1,10)

    save(v, file='datos.RData')

    source('programa_02.R')

    La media es:  5

    #Confirmamos que la media se ajusta al nuevo vector.

**Ejercicio 1.10.** _Los vectores x <- c(2, 1, 5, 2, 4) e y <- c(1, 1, 4, 3, 4) contienen información ordinal. Queremos conocer una medida de su relación a través de la correlación policórica._  
_Comprueba si R dispone de alguna función que responda a nuestra necesidad; en caso contrario, localiza algún paquete que sí permita el cálculo, instálalo y llévalo a cabo._

    x <- c(2, 1, 5, 2, 4)
    y <- c(1, 1, 4, 3, 4)

    #Buscamos en internet un paquete para poder realizar correlaciones policóricas.
    install.packages("polycor")

    trying URL 'https://cran.rstudio.com/bin/macosx/contrib/4.0/polycor_0.7-10.tgz'
    Content type 'application/x-gzip' length 57341 bytes (55 KB)
    ==================================================
    downloaded 55 KB

    The downloaded binary packages are in
        /var/folders/wl/3_k1f0v14bj8qkg1ms40_mph0000gn/T//RtmpkHbfF6/downloaded_packages

    library("polycor")
    polychor(x,y)

    NA/Inf replaced by maximum positive valueNA/Inf replaced by maximum positive valueNA/Inf replaced by maximum positive value

    [1] 0.9970999

**Ejercicio 1.11.** _¿Cómo obtener una media recortada?_ _Una búsqueda en la ayuda (?trimmed mean) no dice nada, y usar la doble interrogación tampoco ayuda mucho. Una búsqueda en Internet puede ayudar, y también explorar la ayuda de mean()._

    mean(v, trim = 0.05)

    [1] 5

<div id="rmd-source-code">LS0tCnRpdGxlOiAiRWplcmNpY2lvcyBUZW1hIDEiCm91dHB1dDogaHRtbF9ub3RlYm9vawotLS0KICAKICAKX19FamVyY2ljaW8gMS40Ll9fCl9RdWVyZW1vcyBjYWxjdWxhciBsYSBjaXJjdW5mZXJlbmNpYSB5IMOhcmVhIGRlIHVuIGPDrXJjdWxvIGRlIHJhZGlvIDEuOCBtZXRyb3MuIFJlY29yZGVtb3MgcXVlIGxhIGNpcmN1bmZlcmVuY2lhIGVzIGRvcyBwaSB2ZWNlcyBlbCByYWRpbzsgZWwgw6FyZWEsIHBvciBzdSBwYXJ0ZSwgZXMgcGkgdmVjZXMgZWwgY3VhZHJhZG8gZGVsIHJhZGlvLl8KX0RlZmluZSB5IG5vbWJyYSBsYXMgdmFyaWFibGVzIGFkZWN1YWRhbWVudGUgeSByZWFsaXphIGxvcyBjw6FsY3Vsb3MgbmVjZXNhcmlvcy5fCgoKYGBge3J9CiNVbiBhdGFqbyBwYXJhIGVzY3JpYmlyIGVsIHPDrW1ib2xvIGRlIGFzaWduYWNpw7NuICg8LSkgZXMgYWx0ICsgJy0nIAoKcmFkaW8gIDwtIDEuOAoKY2lyY3VuZmVyZW5jaWEgIDwtIDIgKiBwaSAqIHJhZGlvCgphcmVhICA8LSBwaSAqIHJhZGlvXjIKCgojIFBhcmVjZSBxdWUgcHJlc2VudGFyIGFzw60gZWwgcmVzdWx0YWRvIGVuIGVsIG5vdGVib29rIGhhY2UgcXVlIGEgY2FkYSBzYWxpZGEgZGUgCiMgcmVzdWx0YWRvcyBhcGFyZXpjYSB1bmEgY2VsZGEgbnVldmEgbG8gY3VhbCBubyBlcyBsbyBpZGVhbCBhIGxhIGhvcmEgZGUgCiMgcHJlc2VudGFyIHJlc3VsdGFkb3MuIMK/TWVqb3IgZW1scGVhciBvdHJhcyBlc3RyYXRlZ2lhcz8gCiAgCiNwcmludChjaXJjdW5mZXJlbmNpYSkKI3ByaW50KCdMYSBjaXJjdW5mZXJlbmNpYSBlczogJykKI3ByaW50KCdFbCDDoXJlYSBkZSBsYSBjaXJjdW5mZXJlbmNpYSBlczogJykKI3ByaW50KGFyZWEpCgojTGEgc29sdWNpw7NuIHF1ZSBtZSBwYXJlY8OtYSBtw6FzIHNpbXBsZSBlcmEgbGEgZGUgZW1wbGVhciAnXG4nIHBhcmEgdW5hIG51ZXZhIAojIGxpbmVhLCBwZXJvIGFsIGZpbmFsIG5vIGhhIHNpZG8gJ3RhbiBzaW1wbGUnLiBQcmltZXJvIGhlIG5lY2VzZXNpdGFkbyBjcmVhciAKIyB1bmEgc3RyaW5nIGNvbiAnc3ByaW50ZicgcGFyYSBpbnRlZ3JhciBsYSB2YXJpYWJsZSBlbiBsYSBzdHJpbmcuIEVtcGxlYXIgbGEKIyBsYSBmdW5jacOzbiAncGFzdGUnIHBhcmEgdW5pciBhbWJhcyB5IHVzYXIgY29tbyBzZXBhcmFkb3IgZWwgJ1xuJy4KCnJlc3VsdGFkbyA8LSBwYXN0ZShzcHJpbnRmKCdMYSBjaXJjdW5mZXJlbmNpYSBlczogJXMnLGFyZWEpLAogICAgICAgICAgICAgICAgICAgc3ByaW50ZignRWwgYXJlYSBlczogJXMnLCBjaXJjdW5mZXJlbmNpYSksIAogICAgICAgICAgICAgICAgICAgc2VwPSJcbiIpCgojUG9yIMO6bHRpbW8sIGltcHJpbWltb3MgZWwgcmVzdWx0YWRvIGNvbiBlbCBmb3JtYXRvIGRlc2VhZG8uCmNhdChyZXN1bHRhZG8pCmBgYAogIAogIApfX0VqZXJjaWNpbyAxLjUuX18KX0NyZWEgbGFzIGZ1bmNpb25lcyBjaXJjdW5mKCkgeSBjaXJjdWxvKCksIGNhZGEgdW5hIGNvbiDDum5pY28gYXJndW1lbnRvLCByYWRpbywgeSBxdWUgZGV2dWVsdmVuIGxhIGxvbmdpdHVkIGRlIGxhIGNpcmN1bmZlcmVuY2lhIHkgZWwgw6FyZWEgZGUgY8OtcmN1bG8gY29ycmVzcG9uZGllbnRlcywgcmVzcGVjdGl2YW1lbnRlLiDCv0VzIHBvc2libGUgY3JlYXIgbGEgZnVuY2nDs24gY2lyYygpLCBjb24gdW4gYXJndW1lbnRvIChyYWRpbyksIHF1ZSBkZXZ1ZWx2YSwgc2ltdWx0w6FuZWFtZW50ZSwgbGEgbG9uZ2l0dWQgeSBlbCDDoXJlYXMgYXNvY2lhZG9zP18KCmBgYHtyfQpjaXJjdW5mIDwtZnVuY3Rpb24ocmFkaW8pewogIHJldHVybiggMiAqIHBpICogcmFkaW8pCn0KCmNpcmN1bG8gPC0gZnVuY3Rpb24ocmFkaW8pewogIHJldHVybihwaSAqIHJhZGlvXjIpCn0KCmNpcmMgPC0gZnVuY3Rpb24ocmFkaW8pewogICNDcmVhbW9zIHVuIHZlY3RvciBwYXJhIHBvZGVyIGFsbWFjZW5hciBsb3MgZGF0b3MKICB2IDwtIGMoKQogIAogICNMb3MgdmVjdG9yZXMgZW4gUiBlbXBpZXphbiBlbiAxIChlbiBQeXRob24gZW1waWV6YW4gZW4gMCkKICB2WzFdIDwtIDIqcGkqcmFkaW8KICB2WzJdIDwtIHBpKnJhZGlvXjIKICAKICAjVGVuZW1vcyBkb3Mgb3BjaW9uZXMgcGFyYSBkZXZvbHZlciBsb3MgcmVzdWx0YWRvczogdW5vIGVuIGVsIHF1ZSAKICAjIHNvbG8gZGV2b2x2ZW1vcyBlbCB2ZWN0b3IgY29uIGxhcyBjaWZyYXMuIERlc2NvbWVudGFyIGVzdGUgcmV0dXJuCiAgIyB5IGNvbWVudGFyIGVsIHNpZ3VpZW50ZSBwYXJhIHZlciBsYSBkaWZlcmVuY2lhLgogICNyZXR1cm4odikKICByZXN1bHRhZG8gPC0gcGFzdGUoc3ByaW50ZignTGEgY2lyY3VuZmVyZW5jaWEgZXM6ICVzJyx2WzFdKSwKICAgICAgICAgICAgICAgICAgIHNwcmludGYoJ0VsIGFyZWEgZXM6ICVzJywgdlsyXSksIAogICAgICAgICAgICAgICAgICAgc2VwPSJcbiIpCgogICNPdHJvIGVuIGVsIHF1ZSBsbyBkZXZvbHZlbW9zIGNvbiBjb250ZXh0by4KICAjUG9yIMO6bHRpbW8sIGltcHJpbWltb3MgZWwgcmVzdWx0YWRvIGNvbiBlbCBmb3JtYXRvIGRlc2VhZG8uCiAgcmV0dXJuKGNhdChyZXN1bHRhZG8pKQogIAp9CgpjaXJjdW5mKHJhZGlvKQpjaXJjdWxvKHJhZGlvKQpjaXJjKHJhZGlvKQoKYGBgCiAgCiAgCl9fRWplcmNpY2lvIDEuNi5fXwpfVmFtb3MgYSBjcmVhciB1biBwZXF1ZcOxbyBwcm9ncmFtYSB5IGx1ZWdvIGxvIGVqZWN1dGFyZW1vcy4gUGFyYSBlbGxvOl8gIApfMS4gQWJyZSB1biBhcmNoaXZvIG51ZXZvIChSIFNjcmlwdCkgZW4gUlN0dWRpby5fICAKXzIuIEVzY3JpYmUgdW4gY29tZW50YXJpbyAoY29uICMpIGFsIGluaWNpbyBpbmRpY2FuZG8gZWwgbm9tYnJlIGRlbCBwcm9ncmFtYSAocHJvZ3JhbWFfMS5SKSB5IGVuIGxhIHNpZ3VpZW50ZSBsw61uZWEsIHN1IGF1dG9yL2EgeSBmZWNoYS5fICAKXzMuIEEgY29udGludWFjacOzbiBjcmVhIHVuIHZlY3RvciwgdiwgZGUgbG9uZ2l0dWQgNyBjb24gbsO6bWVyb3MgcmVhbGVzIGVuIGVsIGludGVydmFsbyBbMCwgMTBdLl8gIApfNC4gQ2FsY3VsYSBsYSBtZWRpYSBkZWwgdmVjdG9yLl8gIApfNS4gTXXDqXN0cmFsYSBwb3IgcGFudGFsbGEuXyAgCl82LiBHdWFyZGEgZWwgYXJjaGl2byBjb24gZWwgbm9tYnJlIGluZGljYWRvIGFudGVyaW9ybWVudGUgeSBjacOpcnJhbG8uXyAgCl83LiBDb21wcnVlYmEgcXVlIGVsIGFyY2hpdm8gZXhpc3RlIHkgZXN0w6EgZW4gZWwgbWlzbW8gZGlyZWN0b3JpbyBlbiBxdWUgZXN0YW1vcyBzaXR1YWRvcyBlbiBSIChwb2RlbW9zIGNvbXByb2JhcmxvIGNvbiBnZXR3ZCgpKS5fICAKXzguIEVqZWN1dGEgZWwgcHJvZ3JhbWEuXyAgCiAgCmBgYHtyfQojIHByb2dyYW1hXzEuUgojIGF1dG9yOnZpY3RvcmVnYjsgMTUvMDQvMjAyMQoKI1Bhc28gMzogQ3JlYSB1biB2ZWN0b3IgdiwgZGUgbG9uZ2l0dWQgNywgaW50ZXJ2YWxvIFswLDEwXQojICAgdiA8LSBjKDAsMyw1LCA3LDksMSwxMCkKCiNFbCBwYXNvIDQgeSA1IGxvIHJlc3VtaW1vcyBlbiB1bmEgc29sYSBsaW5lYS4KIyAgIHByaW50KG1lYW4odikpCgojIEVzdGEgY2VsZGEgbGEgaGUgY29waWFkbyBlbiB1biBzY3JpcHQgZGUgUiB5IGd1YXJkYWRvIHBhcmEgcmVhbGl6YXIgZXN0ZSBwYXNvLgojIEd1YXJkYW1vcyBlbCBhcmNoaXZvIGNvbiBlbCBub21icmUgJ3Byb2dyYW1hXzEuUicKIyBDb21wcm9iYW1vcyBxdWUgZXN0YSBjb24gwr/Cv2dldHdkKCk/PyBMYSBheXVkYSBub3MgcmVjb21pZW5kYSBsaXN0LmZpbGVzIHkKIyBjb3Jyb2JvcmFtb3MgcXVlIHRlbmVtb3MgZWwgcHJvZ3JhbWEuCnNvdXJjZSgncHJvZ3JhbWFfMDEuUicpCmBgYAogIAogIApfX0VqZXJjaWNpbyAxLjcuX18KX0d1YXJkYSBlbCBhbnRlcmlvciB2ZWN0b3IgdiA8LSBjKDksIC00LCAzLjE0KSBlbiB1biBhcmNoaXZvIGxsYW1hZG8gZGF0b3MuUkRhdGEuIENvbXBydWViYSBsYSBleGlzdGVuY2lhIGRlbCBhcmNoaXZvIGVuIGVsIGRpcmVjdG9yaW8gZGUgdHJhYmFqbyBhY3R1YWwuXwoKYGBge3J9CnYgPC0gYyg5LCAtNCwgMy4xNCkKc2F2ZSh2LCBmaWxlPSdkYXRvcy5SRGF0YScpCmBgYAogIAogIApfX0VqZXJjaWNpbyAxLjguX18KX0Fob3JhIHZhbW9zIGEgY29uc3RydWlyIG90cm8gcHJvZ3JhbWEsIHByb2dyYW1hXzIuUiwgcXVlIGxlZXLDoSBlbCBhcmNoaXZvIGRlIGRhdG9zIHJlY2nDqW4gY29uc3RydWlkbyAoZGF0b3MuUkRhdGEpIHkgY2FsY3VsYXLDoSB5IG1vc3RyYXLDoSBsYSBtZWRpYS4gUGFyYSBlbGxvOl8gIApfQWJyZSBlbCBhcmNoaXZvIHByb2dyYW1hXzEuUiBlbiBSU3R1ZGlvLl8gIApfR3XDoXJkYWxvIGNvbiBlbCBub21icmUgcHJvZ3JhbWFfMi5SLl8gIApfQ2FtYmlhIGxhIGzDrW5lYSBkb25kZSBzZSBjcmVhYmEgZWwgdmVjdG9yIHYgcG9yIG90cmEgZG9uZGUgc2UgbGVhIGVsIGFyY2hpdm8gZGUgZGF0b3MgZGF0b3MuUkRhdGEuXyAKX0RlamEgZWwgcmVzdG8gZGVsIHByb2dyYW1hIGlndWFsLl8gIApfR3VhcmRhIGVsIGFyY2hpdm8geSBjacOpcnJhbG8uXyAgCl9Db21wcnVlYmEgcXVlIGVsIGFyY2hpdm8gZXhpc3RlIHkgZXN0w6EgZW4gZWwgbWlzbW8gZGlyZWN0b3JpbyBlbiBxdWUgZXN0YW1vcyBzaXR1YWRvcyBlbiBSLl8gIApfRWplY3V0YSBlbCBwcm9ncmFtYS5fICAKCmBgYHtyfQojRWwgY29udGVuaWRvIGRlIHByb2dyYW1hXzAyLlIgcXVlZGFyaWEgYXPDrToKCiMgICBkYXRhIDwtIGxvYWQoIn4vQ3Vyc29fUi9kYXRvcy5SZGF0YSIpCiMgICBtZWRpYSA8LSBtZWFuKHYpCiMgICBjYXQoIkxhIG1lZGlhIGVzOiAiLCBtZWRpYSkKCnNvdXJjZSgncHJvZ3JhbWFfMDIuUicpCgpgYGAKCl9fRWplcmNpY2lvIDEuOS5fXwpfUG9yIMO6bHRpbW8sIG1vZGlmaWNhcmVtb3MgZWwgdmVjdG9yIHYsIGxvIHZvbHZlcmVtb3MgYSBncmFiYXIgZW4gZGF0b3MuUkRhdGEgeSBlamVjdXRhcmVtb3MgZGUgbnVldm8gcHJvZ3JhbWFfMi5SLiBQb3Igw7psdGltbywgZGViZXJlbW9zIGNvbXByb2JhciBxdWUgZWwgcmVzdWx0YWRvIGRlIGxhIGVqZWN1Y2nDs24gc2UgYWp1c3RhIGFsIG51ZXZvIHZlY3Rvci5fCmBgYHtyfQp2IDwtIGMoMCwzLDUsIDcsOSwxLDEwKQoKc2F2ZSh2LCBmaWxlPSdkYXRvcy5SRGF0YScpCgpzb3VyY2UoJ3Byb2dyYW1hXzAyLlInKQojQ29uZmlybWFtb3MgcXVlIGxhIG1lZGlhIHNlIGFqdXN0YSBhbCBudWV2byB2ZWN0b3IuCmBgYAoKX19FamVyY2ljaW8gMS4xMC5fXwpfTG9zIHZlY3RvcmVzIHggPC0gYygyLCAxLCA1LCAyLCA0KSBlIHkgPC0gYygxLCAxLCA0LCAzLCA0KSBjb250aWVuZW4gaW5mb3JtYWNpw7NuIG9yZGluYWwuIFF1ZXJlbW9zIGNvbm9jZXIgdW5hIG1lZGlkYSBkZSBzdSByZWxhY2nDs24gYSB0cmF2w6lzIGRlIGxhIGNvcnJlbGFjacOzbiBwb2xpY8OzcmljYS5fICAKX0NvbXBydWViYSBzaSBSIGRpc3BvbmUgZGUgYWxndW5hIGZ1bmNpw7NuIHF1ZSByZXNwb25kYSBhIG51ZXN0cmEgbmVjZXNpZGFkOyBlbiBjYXNvIGNvbnRyYXJpbywgbG9jYWxpemEgYWxnw7puIHBhcXVldGUgcXVlIHPDrSBwZXJtaXRhIGVsIGPDoWxjdWxvLCBpbnN0w6FsYWxvIHkgbGzDqXZhbG8gYSBjYWJvLl8gIAoKYGBge3J9CnggPC0gYygyLCAxLCA1LCAyLCA0KQp5IDwtIGMoMSwgMSwgNCwgMywgNCkKCiNCdXNjYW1vcyBlbiBpbnRlcm5ldCB1biBwYXF1ZXRlIHBhcmEgcG9kZXIgcmVhbGl6YXIgY29ycmVsYWNpb25lcyBwb2xpY8OzcmljYXMuCmluc3RhbGwucGFja2FnZXMoInBvbHljb3IiKQpsaWJyYXJ5KCJwb2x5Y29yIikKcG9seWNob3IoeCx5KQpgYGAKCl9fRWplcmNpY2lvIDEuMTEuX18KX8K/Q8OzbW8gb2J0ZW5lciB1bmEgbWVkaWEgcmVjb3J0YWRhP18KX1VuYSBiw7pzcXVlZGEgZW4gbGEgYXl1ZGEgKD90cmltbWVkIG1lYW4pIG5vIGRpY2UgbmFkYSwgeSB1c2FyIGxhIGRvYmxlIGludGVycm9nYWNpw7NuIHRhbXBvY28gYXl1ZGEgbXVjaG8uIFVuYSBiw7pzcXVlZGEgZW4gSW50ZXJuZXQgcHVlZGUgYXl1ZGFyLCB5IHRhbWJpw6luIGV4cGxvcmFyIGxhIGF5dWRhIGRlIG1lYW4oKS5fCgpgYGB7cn0KbWVhbih2LCB0cmltID0gMC4wNSkKCmBgYAoK</div>

</div>

<script>// add bootstrap table styles to pandoc tables function bootstrapStylePandocTables() { $('tr.odd').parent('tbody').parent('table').addClass('table table-condensed'); } $(document).ready(function () { bootstrapStylePandocTables(); }); $(document).ready(function () { $('.knitsql-table').addClass('kable-table'); var container = $('.kable-table'); container.each(function() { // move the caption out of the table var table = $(this).children('table'); var caption = table.children('caption').detach(); caption.insertBefore($(this)).css('display', 'inherit'); }); });</script> <script>$(document).ready(function () { window.buildTabsets("TOC"); }); $(document).ready(function () { $('.tabset-dropdown > .nav-tabs > li').click(function () { $(this).parent().toggleClass('nav-tabs-open'); }); });</script> <script>$(document).ready(function () { window.initializeSourceEmbed("Ejercicios Tema 1.Rmd"); window.initializeCodeFolding("show" === "show"); });</script> <script>(function () { var script = document.createElement("script"); script.type = "text/javascript"; script.src = "https://mathjax.rstudio.com/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"; document.getElementsByTagName("head")[0].appendChild(script); })();</script>