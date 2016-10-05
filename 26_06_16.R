#Scoping Rules
lm
lm<-function(x){x*x}
lm
rm(lm)#remove, borra la fucnión del enviroment
lm

#Ámbito lexicológico
hacer.potencia<-function(n){
  potencia<-function(x){
   x^n 
  }
  potencia
}
##Ejemplo  
cubica<-hacer.potencia(3)
cuadrada<-hacer.potencia(2)
cubica(3)
cuadrada(2)

#Explorar una función
ls(environment(cubica))
get("n",environment(cubica))
ls(environment(cuadrada))
get("n",environment(cuadrada))

#Estático vs Dinámico
y<-10
f<-function(x){
  y<-2
  y^2+g(x)
}
g<-function(x){
  x*y
}
f(3)

#Formato
12345678901234567890123456789012345678901234567890123456789012345678901234567890

#Fechas en R
##Dates and Times
x<-as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))


