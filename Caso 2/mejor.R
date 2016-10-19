mejor <- function(estado, resultado) {
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    hospital <- vector("numeric")
    d <- vector("numeric")
    renglones <- nrow(outcome)
    
    if (resultado == "ataque") {
        columna <- 11
    } else if (resultado == "falla") {
        columna <- 17
    } else if (resultado == "neumonía") {
        columna <- 23
    } else {
        columna <- 2
    }
    
    if (columna>10) {
        h1 <- 0
        for (j in 1:renglones) {
            if (outcome[j,7] == estado) {
                h1 <- length(hospital) + 1
                length(hospital) <- h1
                length(d) <- h1
                hospital[h1] <- outcome[j,2]
                d[h1] <- outcome[j,columna]
            }
        }
        
        if (h1>0) {
            oldw <- getOption("warn")
            options(warn = -1)
            v <- as(d,"numeric")
            options(warn = oldw)
            x <- data.frame(hospital,v,stringsAsFactors = FALSE)
            y <- x[order(v,hospital),]
            y[1,1]
        } else {
            stop("Estado inválido")
        }
    } else {
        stop("Resultado inválido")
    }
}



