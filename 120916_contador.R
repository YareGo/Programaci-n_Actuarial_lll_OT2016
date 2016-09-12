x<-0
y<-0
z<-5
caminata<-vector("numeric")
for (i in 1:100) {
  while(z>=3 && z<=10) {
    moneda<-rbinom(1,1,0.5)
    if(moneda==1){
      z<-z+1
    } else {
      z<-z-1
    }
  caminata<-c(caminata,z)
  }
  if(z>5){
    x<-x+1
  }else{
    y<-y+1
  }
}  
caminata
x
y
