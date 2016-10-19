##clase del 25 de agosto

#crear vectores con la función vector
x<-vector(mode = "numeric", length = 5L)
x

#crear vectores con la función c
x<- c(0.5,0.6)
x
class(x)

x<-c(TRUE ,FALSE ,T ,F)
x
class(x)

x<-10:0
x
class(x)

x<-c(1+2i,5,3+9i,-4-5i)
x
class(x)

x<-c("a","b","c","d")
x
class(x)

#mezcla de objetos en un vector
y<-c(1.7,"a") #caracter
y
class(y)

y<-c(TRUE,2) #numeric
y
class(y)

y<-c("a",TRUE) #caracter
y
class(y)

y<-c(TRUE,10L,8.5, 1 + i,"algo")
y
class(y)

#orden de coaccion/coerencion explicita
#1 character
#2 complex
#3 numeric
#4 integer
#5 logical 

#coercion explicita
z<-0:6





class(z)
as.numeric(z)
as.logical(z)
as.character(z)

z<-c(1+2i,3+4i,8,0+3i,0)
as.logical(z)

z<-c("programacion"."actuaria","III")
as.numeric(z)
as.logical(z)
as.complex(z)

#listas (es como vector. pero de vectores y c/u tiene propia clase)
x<- list(1,"a","TRUE","1+4i")
x
class(x)


#Matrices
m<- matrix(nrow = 2,ncol = 3)
m
dim(m)
atributes(m)
#CAmbio de Dimensiones de2x3 a 3x2
dim (m) <-c(3,2)
m
#Crear una matriz con datos
m<-matrix(1:6,2,3)
m

m<-matrix(1:6,3,2)
m
class(m)
str(m)

dim(m)<-c(2,5)#Esto va a producir error

x<-c(1,2,3)
y<-c("a","b","c")
z<-c(x,y)
z

m1<-rbind(m,x)
m1

m2<-cbind(m,x)
m2

rbind(m1,y)
cbind(m2,y)

#Factores
x<-factor(c("si","no","si","si","no","si","no"))
x
table(x)
unclass(x)
x<-factor(c("si","no","si","si","no","si","no"),levels = c("si","no"))

z<-factor(c("azul","azul","rojo","azul","amarillo","verde","azul"))
x
table(x)

#Valores Faltantes
x<-c(1,2,Na,10,3)
is.na(x)
is.nan(x)

x<-c(1,2,NaN,10,3)
is.na(x)
is.nan(x)

#Data Frames
x<-data.frame(Erick= 1:4,Lori=c(T,T,F,F))
row.names(x)<-c("Primero","segundo","tercero","cuarto")
x
nrow(x)
ncol(x)
attributes(x)
names(x)<-c("Yarely","Karen")
x

#Los nombres no son exclusivos de los data frames
x<-1:3
names(x) #NULL
names(x)<-c("Hugo","Paco","Luis")
x

x<-list(a=1:10,b=100:91,c=51:60)
x
names(x)<-c("Seq1","SEQ2","sEq3")
x


m<-matrix(1:4,2,2)
m
attributes(m)
dimnames(m)<-list(c("fil1","fil2"),c("col1","col2"))
m

e<-matrix(NA,5,6)
e
dimnames(e)<-list(c(1:5),c("a","b","c","d","e","f"))
e

#Lectura de Datos
getwd()
setwd("~/GitHub/Programacion_Actuarial_lll_OT2016")
data<-read.csv("datos s&p.csv")
data<-read.table("datos s&p.csv",T,",",nrows = 100)
clases<-sapply(data, class)
data<-read.table("datos s&P.csv",T,",",colclasses =clases)
data

#uso de dput y dget
y<-data.frame(a=1,b="a")
dput(y)
dput(y,file="y.R")
nueva.y<-dget("y.R")
y
nueva.y ######No sale

x<-"Programación actuarial III"
y<-data.frame(a=1,b="a")
dump(c("x","y"),file = "data.R")
rm(x,y)
source("data.R")

#Archivo de airquality
airquality<-data.frame(a=1,b="a")
dput(airquality)
dput(airquality,file="airquality.R")
airquality

#creamos un vector
x<-c("a","b","c","d","e")
#veamos el vector
x
#extraemos elementos con []
x[1]
x[2]
#también podemos extraer una secuencia de elementos
x[1:4]
#es poible extraer los elementos que cumplen una restricción
x[x>"b"]
#de manera equivalente se puede obtener un vector lógico
u<-x=="c"
u
x[u]

#creamos una lista
x<-list(foo=1:4,bar=0.6)
#extraemos el primer elemento de la lista
#este elemento es una lista que contiene una secuencia
x[1]
#extraemos nuevamente el primer elemento de la lista
#ahora el elemento es la secuencia en si
x[[1]]
#extraemos un elemento por nombre
x$bar
x[["bar"]]
x["bar"]

#creamos una lista de 3 elementos
x<-list(foo=1:4,bar=0.6,baz="Hola")
#Extraemos el primer y tecer elemento de la lista
x[c(1,3)]
x[[c(1,3)]]

#subconjuntos de listas
x<-list(foo=1:4,bar=0.6,baz="Hola")
name<-"foo"
x[[name]]
x$name
x$foo

#se pueden extraer elementos de los elementos extraídos
x<-list(a=list(10,12,14),b=list(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]#la extración de un conjunto, es el conjunto de las extraciones
x[[c(2,1)]]
#ej. extra
x[[1]][3]

x<-matrix(1:6,2,3)
x
#El resultado es un vector
x[1,2]
#con drop=FALSE,se mantiene la dimensión y
#el resultado será una matriz
x[1,2,drop=FALSE]
#si dejamos solamente el espacio, el resultado será un vector
x[1,]
#si usamos drop=FALSE, el resultado será una matriz
x[1, ,drop=FALSE]
##
x[2,1]
x[1,]
x[,2]

#también se puede encontrar el nombre de algunos objetos de manera parcial con $
x<-list(aardvark=1:5)
x$a
x[["a"]]
x[["a",exact=FALSE]]

airquality[1:6,]
completos<-complete.cases(airquality)
completos
airquality[completos,][1:6,]
airquality[1:6,][completos,]


x<-1:4;y<-6:9
x
y
x+y
x>2
x>=2
y==8
x*y
x/y

x<-matrix(1:4,2,2);y<-matrix(rep(10,4),2,2)
x*y
x/y
x%*%y #multiplicación de matrices
