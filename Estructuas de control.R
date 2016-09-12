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
