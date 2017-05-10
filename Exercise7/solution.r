library(FNN)

# Computer data : need to predict PRP.
computerData = read.table("ComputerData.txt", header=T)

# Remove the variable model (name), vendor (name) and ERP
usefulData = computerData[, c("MYCT", "MMIN", "MMAX", "CACH", "CGMIN", "CHMAX", "PRP")]
predictors = names(usefulData)
summary(usefulData)

# Standardized the values
means = lapply(usefulData, mean)
sd = lapply(usefulData, sd)
usefulData = (usefulData - means) / sd
summary(usefulData)
attach(usefulData)

# train <- sample(209, 188)
# test <- (1:209)[-train]
# sigReg <- lm(formula = PRP ~ MMAX, data=usefulData[train,])
# predictSigReg<- predict(sigReg, usefulData[test,], interval="prediction")
# mseSigReg <- sum((predictSigReg-usefulData[test,]$PRP)^2)/nrow(usefulData[test,])

# train <- sample(209, 188)
# test <- (1:209)[-train]
# mulReg <- lm(formula = PRP ~ MYCT + MMIN + MMAX + CACH + CGMIN + CHMAX, data=usefulData[train,])
# predictMulReg<- predict(mulReg, usefulData[test,], interval="prediction")
# mseMulReg <- sum((predictMulReg-usefulData[test,]$PRP)^2)/nrow(usefulData[test,])

# single regression
library(boot)
set.seed(123)
cv.errorSigReg <- rep(0,10)
cv.SigMse <- rep(0,10)
print("signle regression time")
for (i in 1:10) {
  glm.mod <- glm(PRP~poly(MMAX,i), data=usefulData)
  cv.SigMse[i] <- sum((glm.mod$residuals)^2)
  cv.errorSigReg[i] <- cv.glm(usefulData,glm.mod,K=10)$delta[2]
}
cv.SigMse

# multiple regression
library(boot)
set.seed(123)
cv.errorMulReg <- rep(0,10)
cv.MulMse <- rep(0,10)
for (i in 1:10) {
  glm.mod <- glm(PRP~poly(MYCT + MMIN + MMAX + CACH + CGMIN + CHMAX,i), data=usefulData)
  cv.MulMse[i] <- sum((glm.mod$residuals)^2)
  cv.errorMulReg[i] <- cv.glm(usefulData,glm.mod,K=10)$delta[2]
}
cv.MulMse

# Test K-NN model with LOO
computer.knn = knn.reg(usefulData, test = NULL, y = PRP, k = 2)
sum(computer.knn$residuals^2)
