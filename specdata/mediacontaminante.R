#Parte 1


##directorio:vector de carateres de tamaño 1 con la dirección de
  ##ubicación de las bases de datos
##contaminante:es un vector de caracteres de tamaño 1 que indica el nombre del
    ##contaminante que se determinará la media, sulfato o nitrato
##id:es un vector de enteros que indica los ID's de los monitores a usar
##Regreda la media del contmainante que se solicita a los largo de los 
    ##monitores mencionados en el vector (Ignorando los NA's)
mediacontaminante<-function(directorio,contaminante,id){  
  directorio<-setwd("~/GitHub/Programacion_Actuarial_lll_OT2016/specdata/specdata")
  x<-length(id)
  xoxo<-vector("numeric",x)
  yoyo<-xoxo

  if (contaminante == "sulfato"){
    c<-2
  }else{ 
    c<-3
  }  


  for (i in 1:x) {
    ido<-id[i]
    if (ido<10){
      idoo<-paste("00",ido, sep="")
    }else if (ido<99){
      idoo<-paste("0",ido,sep="")
    }else{
      idoo<-ido
    }
  
    idyo<-paste(idoo,".csv",sep="")
    lala<-paste(directorio,idyo,sep="/")
    leearchivo<-read.csv(lala)
    yoyo[i]<-sum(complete.cases(leearchivo[,c]))
    xoxo[i]<-mean(leearchivo[,c],na.rm=T)
  }
    media<-sum(xoxo*yoyo)/sum(yoyo)
    media
}
