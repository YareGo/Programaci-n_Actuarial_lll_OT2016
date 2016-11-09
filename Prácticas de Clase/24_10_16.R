getwd()
tail(list.files(),2)
setwd("./testdir")
setwd("../")#se va disminuyecndo la dirección, sube uno
getwd()
setwd("~") #se va a home

#crear un documento data
if(!file.exists("data")){
    dir.create("data")
}

#para garantizar que el archivo existe y crear una carpeta
#para guardar los datos descargados
if(!file.exists("data"))dir.create("data")

#descargar datos de internet
url<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(url,destfile = "./data/camaras.csv")
list.files("./data")

fechaDescarga<-date()
fechaDescarga

#cargar los datos desde mi computadora,donde $=%
dataCam<-read.table("./data/camaras.csv",sep=",",header=T)#$
head(dataCam)
dataCam<-read.csv("./data/camaras.csv") #%

#descarga el archivo excel
if(!file.exists("data")){dir.create("data")}
url<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD&bom=true"
download.file(url,destfile = "./data/camaras.xlsx",method = "curl")
fechaDescarga<-date()

