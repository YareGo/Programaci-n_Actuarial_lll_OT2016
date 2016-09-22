#Parte 2

##directorio:vector de carateres que indica la ubicación
  ##de los archivos CSV
##id:es un vector de enteros que indicando los monitores a
  ##ser utilizados
##id es el ID del monitor t nobs el número de casos completos

completos<-function(directorio,id){  
  directorio<-setwd("~/GitHub/Programacion_Actuarial_lll_OT2016/specdata/specdata")
  x<-length(id)
  nobs<-vector("numeric",x)
  
  
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
    nobs[i]<-sum(complete.cases(leearchivo))
   
  }
    data.frame(id,nobs)
}
