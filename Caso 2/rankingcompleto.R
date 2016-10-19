rankingcompleto <- function(resultado, num) {
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    renglones <- nrow(outcome)
    State <- unique(outcome[,7])
    new <- vector("character", 54)
    
    if (resultado == "ataque") {
        columna <- 11
    } else if (resultado == "falla") {
        columna <- 17
    } else if (resultado == "neumonía") {
        columna <- 23
    } else {
        columna <- 2
    }
    
    if (columna>5) {
        for (w in 1:54) {
            estado<- State[w]
            hospital <- vector("numeric")
            mor <- vector("numeric")
            h1 <- 0
            
            for (j in 1:renglones) {
                if(outcome[j,7] == estado) {
                    h1 <- length(hospital) + 1
                    length(hospital) <- h1
                    length(mor) <- h1
                    hospital[h1] <- outcome[j,2]
                    mor[h1] <- outcome[j,columna]
                }
            }
            
            oldw <- getOption("warn")
            options(warn = -1)
            v <- as(mor,"numeric")
            options(warn = oldw)
            x<-data.frame(hospital,v,stringsAsFactors = FALSE)
            y<- x[order(v,hospital),]
            
            if (num == "mejor") {
                new[w] <- y[1,1]
            } else if (num == "peor") {
                last <- nrow(y[complete.cases(y),])
                new[w] <- y[last,1]
            } else {
                new[w] <- y[num,1]
            }
        }
        m <- data.frame(new,State,stringsAsFactors = FALSE)
        n <- m[order(State,new),]
        n
    } else {
        stop("Resultado inválido")
    }
}       