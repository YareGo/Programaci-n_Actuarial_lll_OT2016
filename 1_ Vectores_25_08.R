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
