# Q1
norm2 <- function(x) {
  if(is.numeric(x)){
    return(sqrt(sum(x*x)))
  }
  else{
    stop('input is not a vector or a scalar')
  }
}

# Q2
norm1 <- function(x) {
  if(is.numeric(x)){
      return(sum(abs(x)))
  }
  else{
    stop('input is not a vector or a scalar')
  }
}