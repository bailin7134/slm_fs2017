# solution of exercise 3
# question 1
secondMinSquared <- function (x) {
  # check the input is vector or not
  if (!is.vector(x)) {
    stop('input is not a vector!')
    # return error and quit
  }
  
  if (!is.numeric(x)){
    stop('input vector contains non-numeric element(s)')
  }

  # squared the vector
  # find the minimum value and delete
  # find the min of remained vector
  x <- x^2
  x <- x[-c(which.min(x))]
  secondMin <- min(x)
  return(secondMin)
}

# question 2
vecSummary <- function (x){
  # check the input is vector or not
  if (!is.vector(x)) {
    stop('input is not a vector!')
    # return error and quit
  }
  
  if (!is.numeric(x)){
    stop('input vector contains non-numeric element(s)')
  }
  vecSum <- c(mean(x), median(x), var(x), min(x), max(x))
  return(vecSum)
}

# question 3
generateSample <- function (n_samples, mean, stdev){
  return (sample(rnorm(n_samples, mean=mean, sd=stdev),n_samples))
}

# question 4
testList <- list()
totalSample <- c()
for(i in 1:20) {
  x <- generateSample(20, 2, 1.5)
  result <- t.test(x, mu=1.5, alternative='two.sided')
  totalSample <- append(totalSample, x)
  
  testList[[i]] <- result
}
# print(testList)
# the mean = 1.5 for each smaples varies. Some of them are true but other are not. 

t.test(totalSample, mu=1.5, alternative='two.sided')
# if get together all the samples, the mean is almost 1.5