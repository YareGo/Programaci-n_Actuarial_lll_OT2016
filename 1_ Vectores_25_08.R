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
data<-read.table("datos s&p.csv","T",",")
data