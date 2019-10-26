############## R - Enviroments #################
################################################

#El entorno o ambiente es el atributo de los objetos que nos indica el "lugar o 
#espacio" en el que están.

#Por lo que un entorno es una coleccion de objetos, cuando inicias una sesión de R o Rstudio estas
#iniciando un entorno y cada objeto creado pertenecera a ese entorno

#En el uso "cotidiano2 el concepto de entornos no es esencial, pero si vas a hacer
#uso de objetos R6 y 
#paquetes dinamicos como ggplot2, debes entender lo básico como que todo los 
#ambientes tienen "padres", #variables globales y variables locales

environment()               ## comando para mostar el ambiente, si es vacio será "R_GlobalEnv"

x<- 0.001                   ## creamos un objeto
x

x<-"esto es x"              ##creamos un objeto
x

#los objetos dentro de un mismo entorno deben tener nombre unicos, sino se hara 
#reasignación de valores

ls()                        ##Listar los objetos en el "R_Global"

#####################
##### Funciones #####
#####################

#Una funcion es un objeto que puede realizar acciones, esta pueden requerir otros
#objetos y retornarlos.
#Las funciones generan su propio ambiente, donde los objetos creados y usados son
#almacenados

obj_1<-1                    ##objeto númerico
obj_2 <- "a"                ## objeto caracter

c<- function(){             ###hacer una función
  x<-0                      ### crear el objeto x que es númerico
}

ls()                        ##estando en el ambiente gloval "c" "obj_1" "obj_2"

c()                       

ls()                        ## la x asignada en c no se muestra en la lista debido a que se encuentra en el ambiente local 

################################
###### Variables globales#######
################################

#los objetos globales son los que se encuentran en el ambiente más general

#La globalidad es un atributo de la perspectiva de los ambientes, siendo los 
#objetos del ambiente
#el ambiente parental son globales

#veamos esta globalidaad:

global_ambiente<-10        #objeto creado en el ambiente global

fun_1<-function(){         #segundo entorno
  amb_1 <- global_ambiente+1
  fun_2 <- function(){     #tercer entorno
    amb_2<-amb_1 + 1
    print(ls())            #Lista los objetos en el entorno de trabajo
    print(amb_2)
    print(environment())
  }
  print(ls())              #Lista los objetos en el entorno de trabajo
  print(amb_1)
  print(environment())
  fun_2()
}

fun_1()                    #el primer entorno corresponde a la fun_1 que tiene dos objetos

#Las variables locales pueden ser usadas en entornos descendientes pero las parentales no 
#pueden usar las de sus descendientes

#####################################
#######variables locales#############
#####################################

#objetos que solo existen en un entorno especifico y son invisibles para los otros entornos.

a<-20                    #objeto global

fun_1<-function(){
  a<-10                  #objeto local
  print(a)
  
 fun_2<-function(){
   a<-"hello"            #objeto local
   return(a)
 }
 fun_2()
}

fun_1()                 #ejecutar la función
a                       #El valor de "a" es dado por el objeto global no por los locales

##############################
####### Retornar valores######
##############################

#<<- nos permite retornar el valor de una variables a su ambiente parental.
#puede redefinir y escribir objetos.

a<-20                   #objeto global

fun_1<-function(){        
  a<<-10                #Objeto local reasignando al objeto "a"
  print(a)
  
  fun_2<-function(){
    a<<- "hello"        #Objeto local reasignado al objeto "a"
    return(a)
  }
  fun_2()
}

fun_1()                #Ejecutar la función
a                      #El valor de "a" es dado por el objeto retornado

##############################
####### Ejercicio en clase####
##############################

f<-function(y, fun){
  d<-8
  print(environment(fun))
  return(fun(d,y))}

h<-function(dee, yyy){
  return(dee*(w+yyy))}

d<-12                                #### el ambiente global estara constituido por las funciones "f", "h" y el objeto "d"
