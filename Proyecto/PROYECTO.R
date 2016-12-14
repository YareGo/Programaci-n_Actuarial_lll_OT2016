g <- function(col){
library(Rsolnp)
archivo <- read.csv("r.csv", header = T)
longitud <- length(archivo[,col])
assign("longitud", longitud, .GlobalEnv)
datos <- gsub(",","",archivo[1:longitud,col])
real <- as.numeric(paste(datos))
assign("real", real, .GlobalEnv)
x0 = c(0.002,.0001,1.105)
resultado=solnp(x0, fun = f, LB=c(0.001,0.000001,1.09), UB=c(0.003,0.001,1.12))
assign("resultado", resultado, .GlobalEnv)
}

f <- function(x){
    modelo <- vector("integer", longitud)
    final <- vector("integer", longitud)
    assign("final", final, .GlobalEnv)
    error <- vector("numeric", longitud)
    longitud2 <- longitud -1
    assign("longitud2", longitud2, .GlobalEnv)
    edad <- (0:longitud2)
    inicial <- real[1]
    assign("inicial", inicial, .GlobalEnv)
    for (j in 0:longitud2) {
        modelo[j+1] <- trunc(exp((x[2]/log(x[3]))*(1-x[3]^j) - x[1]*j)*inicial)
        error[j+1] <- (modelo[j+1]-real[j+1]) ^2
    }
    errorT <- sqrt(mean(error))
    errorT
}


r <- resultado$pars
for (j in 0:longitud2) {
    final[j+1] <- trunc(exp((r[2]/log(r[3]))*(1-r[3]^j) - r[1]*j)*inicial)
}

plot(real,col = "red", type = "l", xlab = "", ylab = "", axes = F)
par(new = T)
plot(final, col ="blue", type = "l", xlab = "Edad", ylab = "Población")
legend("bottomleft", inset = 0.05, c("real", "modelo"), fill = c("red", "blue"))
title(main = "Análisis de supervivencia")

     