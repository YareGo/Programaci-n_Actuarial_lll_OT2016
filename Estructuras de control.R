###IF-ELSE
if(<condition>){
  ##algunas intrucciones
} else{
  ##algunas OTRAS instrucciones
}

if(<condition>) #Diferente
  
y<-if(x>3) {
  10
}else{
  0
}
  
if(x>3){
  y<-10
}else{
  y<-0
}

###CICLOS FOR
for (i in 1:10) {
  print(i)  
}
#for 1
X<-C("a","b","c","d")
for (i in 1:4 ) {
  print(x[i])
}
#for 2
for (i in seq_along(x)) { #hace la secuencia a lo largo de x
  print(x[i])
}
#for 3
for(letra in x){
  print(letra)
}
#for 4
for(i in 1:4) print(x[i]) #es igual al primero, sólo que se puede simplicar así
#ejemplo 
s<-matrix(1:6,2,3)
s
for(fila in s){
  print(s[fila,])
}
#ejemplo completo
x<-matrix(1:6,2,3)
for(i in seq_len(nrow(X))) {
    for(j in seq_len(ncol(X))){
        print(x[i,j])
    }
}

x0<-1
tol<-1e-8
repeat{
  x1<-calculaEstimado(x0)
  if(abs(x1-x0)<tol){ #es como un método de interpolación
    break
  }else{
  x0<-1
    }
}

#Creación de Funciones
suma2<-function(x,y){
  x+y
} #se corre primero la función para almacenar en la memoria ésta

mayor10<-function(x){ #se va a crear un vector
    x[x>10]
}

mayorque<-function(x,n){
  x[x>n]
}
 
promedioCol<-function(x,quitar.NA=TRUE){
  nc<-ncol(x) #número de columnas
  medias<-vector("numeric",nc)
  for(i in 1:nc){
    medias[i]<-mean(x[,i],na.rm=quitar.NA)#es ,i porque queremos toda la columna, sin número de fila
  }
  medias #para que te de el resultado final 
}

#Evaluación perezosa
f<-function(a,b){
  a^2
}

f<-function(a,b){
  print(a)
  print(b) #si no se pone el algumento b al correr te va a marcar error
}


paste("a","b",se=":")
paste("a","b",":")
paste("a","b",sep=":")
