x<- 0 #arriba
y<- 0 #abajo
z <- 5
caminata<-vector("numeric")
for (i in 1:100) {
  while(z>=3 && z<=10)
    #print(z)
    
    moneda<-rbinom(1,1,0.5)
    if(moneda==1){#caminata aleatoria
      z<-z+1
    }else{
      z<-z-1
      caminata<-c(caminata,z)
    }
}
  print(caminata)
  if(z>5){
      x<-x+1
  }else{
      y<-y+1
      }
#caminata[i]
#plot(caminata,type="l")

x
y
