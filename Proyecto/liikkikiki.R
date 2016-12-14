g <- function(col){
library(Rsolnp)#paquete
archivo <- read.csv("r.csv", header = T)#lee el archivo
longitud <- length(archivo[,col])#total de datos que hay en la fila
assign("longitud", longitud, .GlobalEnv)#hace la variable longitud universalpara ocupar en la siguiente función
datos <- gsub(",","",archivo[1:longitud,col])#le quita las comas a los datos para hacerlos caracter
real <- as.numeric(paste(datos))#la varible anterior la hace númerica
assign("real", real, .GlobalEnv)#también para hacerla real
x0 = c(0.002,.0001,1.105)#valores iniciales para solver
resultado=solnp(x0, fun = f, LB=c(0.001,0.000001,1.09), UB=c(0.003,0.001,1.12))#paquete de solver
assign("resultado", resultado, .GlobalEnv)#para hacer universal la variable
}

f <- function(x){
    modelo <- vector("integer", longitud)#
    error <- vector("numeric", longitud)#numeric para que pueda tomar los modelos que sea
    longitud2 <- longitud -1 #para que ignore el titulo
    edad <- (0:longitud2)
    inicial <- real[1] #para que te de la población inicial
    for (j in 0:longitud2) {
        modelo[j+1] <- trunc(exp((x[2]/log(x[3]))*(1-x[3]^j) - x[1]*j)*inicial)
        error[j+1] <- (modelo[j+1]-real[j+1]) ^2
    }
    errorT <- sqrt(mean(error))
    errorT
}

f(x)
g(1)
g(24)


#datos
final <- vector("integer", longitud)
r<-resultado$pars
for (j in 0:longitud2) {
    final[j+1]<-trunc(exp((r[2]/log(r[3]))*(1-r[3]^j) - r[1]*j)*inicial)
}




