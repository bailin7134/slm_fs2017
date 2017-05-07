# single regression
myData <- read.table("ComputerData.txt", header=T)
#subset < !(is.na(myData["MYCT","MMIN","MMAX","CACH","CGMIN","CHMAX"]))
usefulData <- myData[c("MYCT","MMIN","MMAX","CACH","CGMIN","CHMAX","PRP")]
attach(usefulData)
#set.seed(123)
#train <- sample(209,104)
#test <- (1:209)[-train]

library(boot)
set.seed(123)
cv.error <- rep(0,10)
for (i in 1:10) {
  glm.mod <- glm(PRP~poly(MMAX,i), data=usefulData)
  cv.error[i] <- cv.glm(usefulData,glm.mod,K=10)$delta[2]
}
cv.error

# multiple regression
library(boot)
set.seed(123)
cv.error <- rep(0,10)
for (i in 1:10) {
  glm.mod <- glm(PRP~poly(MYCT + MMIN + MMAX + CACH + CGMIN + CHMAX,i), data=usefulData)
  cv.error[i] <- cv.glm(usefulData,glm.mod,K=10)$delta[2]
}
cv.error

# Q2
train <- sample(209, 105)
test <- (1:209)[-train]
library(class)
prediction <- knn(usefulData[train,], usefulData[test,], myData[train,]$PRP, k=5)
new_prediction <- as.numeric(as.character(prediction))
mse_predict <- sum((new_prediction - myData[test,]$PRP)^2)/length(new_prediction)