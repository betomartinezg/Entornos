#######################################
##### TAREA DE ENTORNOS    ############
#######################################


# Responda las siguientes preguntas y comente las operaciones y valores de cada objeto en cada funci贸n
# ejerc 1 ---------------------------------------

func_1 <- function(u){                              #### se creo una funci髇 que se asigna en el ambiente global por defecto
  
  u <<- 2*u   # es un reasignaci贸n local o global? rta/ es una reasignacion global debido a que el comando <<- cuando no encuentra una variable existente, crea una en el entorno global
  
  return(u)
  
}

u <- 1                                              ##### se creo un vector (u) que se asigna al ambiente global por defecto

func_1(u) # es un reasignaci贸n local o global? rta/ es una reasignacion global, debido a que el vector que se encuentra en el ambiente global es aplicado dentro de la funcion


# ejerc 2 ---------------------------------------

func_1 <- function(u){                             ##### se crean dos funciones asignadas en el ambiente global con un mismo vector
  
  u <- 2*u                                         #### dentro de la funci髇 se crea un vector con argumentos especificos, asignado en la ambiente local 
  
  func_2 <- function(uu){
    u <<- 3*uu    # es un reasignaci贸n local o global?rta/ es una reasignacion local debido a que solamente se esta reemplazando su valor dentro de la  funcion
    
  }
  
  return(u)                                           ##### la funci髇 return permite la definicion de las funciones
  return(func_2(u))
  
}

u <- 1

func_1(u) # es un reasignaci贸n local o global? rta/ es una reasignacion global debido a que se esta utilizando un vector dentro de una funcion previamente en el ambiente global



# ejerc 3 ---------------------------------------

fun_1 <- function(d, j){                                 ####se creo una funci髇 que se asigna en el ambiente global por defecto, con vectores definidos
  d <- 8
  j <- "esto es local y por defecto"
  paste(d,j, sep = " ")
}

v1 <- 1                                                  ####se crearon dos vectores asignados al ambiente global       
v2 <- "esto es global y un argumento

fun_1()      #porque ignora las variables locales? rta/ En realidad la funci髇 no esta ingnorando las variables locales, mas sin embargo las que no fueron asignadas corresponde a variables globales


# ejerc 4 ---------------------------------------

fun_1 <- function(d = 8, j = "esto es local y por defecto"){               ####se creo la funci髇 fun_1 asignada al ambiente global
  paste(d,j, sep = " ")
}

fun_1()                 ######que valores muestra, explique su respuesta  rta/ 8 esto es local y  por defecto debido a que la funcion nos concatena los vectores que se encuentran en el ambiente local y los convierte en caracteres

fun_1(d = v1, j = v2)   #####que valores muestra, explique su respuesta  rta/ error in paste(d, j, sep=" ") esto sucede ya que los objetos v1 y v2 no existen, ademmas de que no se cumple con los argumentos de la funci髇
fun_1
