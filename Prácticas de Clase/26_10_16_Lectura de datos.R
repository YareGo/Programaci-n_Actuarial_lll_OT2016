#Lectura de datos
colindex#extrae los elementos en ese rango
####
#Leer el arcvhivo XML en R
install.packages("XML")
library(XML)
url<-"http://www.w3schools.com/xml/simple.xml"
data<-xmlTreeParse(url,useInternalNodes = TRUE)
nodoRaiz<-xmlRoot(data)
xmlName(nodoRaiz)
names(nodoRaiz)
nodoRaiz[[1]]
nodoRaiz[[1]][[1]]
xmlSApply(nodoRaiz,xmlValue)

##obtener menus y precios
xpathSApply(nodoRaiz,"//name",xmlValue)
xpathSApply(nodoRaiz,"//price",xmlValue)


#Lectura desde JSON
install.packages("jsonlite")
library(jsonlite)
jsonData<-fromJSON("http://api.github.com/users/YareGo/repos")
names(jsonData)
jsonData$name

#conversión a JSON
iris #base de datos
#de una base de datos lo convertimos a dataframe
myjason<-toJSON(iris,pretty=TRUE) 
cat(myjason)
#de dataframe lo conviertes a una base de datos
iris2<-fromJSON(myjason)
head(iris2)


#crear data tables como data frames
library(data.table)
DF=data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)

DT=data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)

tables()#Ver las tablas en la memoria

DT[2,]
DT[DT$y=="a"]
DT[c(2,3)]
DT[,c(2,3)]
DT[,list(mean(x),sum(z))]#lo que va después de la coma, son expresiones que va a evaluar
DT[,table(y)]

##agregar nuevas columnas
DT[,w:=z^2]
DT

DT2<-DT
DT[,y:=2]
DT
head(DT)
head(DT2)

##operaciones multiples
DT[,m:={tmp<-(x+z);log2(tmp+5)}]
DT
DT[,a:=x>0]
DT
DT[,b:=mean(x+w),by=a]#separo conforme al valor que se tenía en a
DT

##variables especiales
set.seed(123)
DT<-data.table(x=sample(letters[1:3],1E5,TRUE))#1E5=10^5,TRUE sig. que se va a hacer con reemplazo
DT[,.N,by=x]
