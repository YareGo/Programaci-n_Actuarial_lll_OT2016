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

#conversi�n a JSON
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
DT[,list(mean(x),sum(z))]#lo que va despu�s de la coma, son expresiones que va a evaluar
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
DT[,b:=mean(x+w),by=a]#separo conforme al valor que se ten�a en a
DT

##variables especiales
set.seed(123)
DT<-data.table(x=sample(letters[1:3],1E5,TRUE))#1E5=10^5,TRUE sig. que se va a hacer con reemplazo
DT[,.N,by=x]

DT<-data.table(x=rep(letters[1:3],each=100),
y=rnorm(300))
setkey(DT,x)
DT['a']

##lectura r�pida
DT1<-data.table(x=c('a','a','b','dt1'),y=1:4)
DT2<-data.table(x=c('a','b','dt2'),z=5:7)
setkey(DT1,x);setkey(DT2,x)
merge(DT1,DT2)

set.seed(1)
df_gde<-data.frame(x=rnorm(1E6),y=rnorm(1E6))
file<-tempfile()
write.table(df_gde,file=file,row.names = F,col.names = T,sep="\t",quote = F)
system.time(fread(file))#fast read
system.time(read.table(file,header=T,sep = "\t"))

##Conexiones y listados
install.packages("RMySQL")
library("RMySQL")
ucscDb<-dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(ucscDb,"show databases;");dbDisconnect(ucscDb);
result

##Conectar a hg19 y listado de tablas
hg19<-dbConnect(MySQL(),user="genome",db="hg19",
                host="genome-mysql.cse.ucsc.edu")
tablas<-dbListTables(hg19)
length(tablas)
tablas[1:3]

##Obtener dimensiones de una tabla en especifico
dbListFields(hg19,"affyU133Plus2")

dbDisconnect(hg19)#para desconectar
               