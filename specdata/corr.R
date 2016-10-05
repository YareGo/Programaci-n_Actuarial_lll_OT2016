#Parte 3
##directorio:vector de tamaño de caracteres de tamaño 1 con la 
  ##dirección de ubicaci+on de los archivos
##horizonte:es un vector númerico de tamaño 1 que indica el 
  ##número de casos completos requeridos para calcular la 
  ##correlación entre nitrato y sulfato en ese monitor
##Regresa un vector con las correlaciones de los que cumplieron

corr<-function(directorio,horizonte){
  directorio<-setwd("~/GitHub/Programacion_Actuarial_lll_OT2016/specdata/specdata")
  x<- 0
  y<-length(list.files(directorio))
  resultado<-vector("numeric")
  id<-vector("numeric")
  a <- 1
  horizonte <- 100
  for(a in 1:y){
    xao<-paste(directorio,list.files(directorio)[a],sep="/")
    db<-read.csv(xao)
    yolo<-sum(complete.cases(db))
    if (yolo>horizonte){
      x<-x+1
      length(id)<-length(id)+1
      id[x]<-list.files(directorio)[a]
      length(resultado)<-length(resultado)+1
      
     }
  }
  lili<-length(id)
  for (i in 1:lili){
      me<-paste(directorio,id[i],sep="/")
      k<-read.csv(me)
      p<-k[,2]
      d<-k[,3]
      resultado[i]<-cor(p,d,use="complete.obs")
  }
  
  resultado
}
corr(directorio, 100)
