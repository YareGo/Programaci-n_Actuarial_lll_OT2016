mejor <- function(estado, resultado) {
    setwd("~/GitHub/Programacion_Actuarial_lll_OT2016/Caso 2/Calidad de Hospitales - data")
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    hospital <- vector("numeric")
    mor <- vector("numeric")
    renglones <- nrow(outcome)
    
    if (resultado == "ataque") {
        columna <- 11
    } else if (resultado == "falla") {
        columna <- 17
    } else if (resultado == "neumon�a") {
        columna <- 23
    } else {
        columna <- 2
    }
    
    if (columna>5) {
        h1 <- 0
        for (j in 1:renglones) {
            if (outcome[j,7] == estado) {
                h1 <- length(hospital) + 1
                length(hospital) <- h1
                length(mor) <- h1
                hospital[h1] <- outcome[j,2]
                mor[h1] <- outcome[j,columna]
            }
        }
        
        if (h1>0) {
            oldw <- getOption("warn")
            options(warn = -1)
            v <- as(mor,"numeric")
            options(warn = oldw)
            x <- data.frame(hospital,v,stringsAsFactors = FALSE)
            y <- x[order(v,hospital),]
            y[1,1]
        } else {
            stop("Estado inv�lido")
        }
    } else {
        stop("Resultado inv�lido")
    }
}



