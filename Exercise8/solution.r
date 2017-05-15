carData <- read.table("Cars2Data.txt",header=T,sep="")
# useful data extraction
usefulData = carData[, c("mpg", "cylinders", "displacement", "horsepower", "weight", "acceleration", "year")]
usefulData<-subset(usefulData, horsepower>0)
predictors = names(usefulData)
# Standardized the values
means = lapply(usefulData, mean)
sd = lapply(usefulData, sd)
usefulData = (usefulData - means) / sd
summary(usefulData)
attach(usefulData)

# model 1: simple linear regressionlibrary(boot)
library(boot)
set.seed(123)
print("signle regression time")
glm.mod1 <- glm(mpg~weight, data=usefulData)
cv.errorSigReg <- cv.glm(usefulData,glm.mod1,K=10)$delta[2]
cv.errorSigReg
# model 2: multi linear regression
glm.mod2 <- glm(mpg~weight+year+horsepower+acceleration+displacement+cylinders, data=usefulData)
cv.errorMul1Reg <- cv.glm(usefulData,glm.mod2,K=10)$delta[2]
cv.errorMul1Reg
# model 3: multiple linear regression
cv.errorPolyReg <- rep(0,10)
for (i in 1:10) {
  glm.mod3 <- glm(mpg~poly(weight,i), data=usefulData)
  cv.errorPolyReg[i] <- cv.glm(usefulData,glm.mod3,K=10)$delta[2]
}
cv.errorPolyReg
# the best model is i=2

# t-test


# Q2:
cancerData <- read.table("Cancer.txt",header=T,sep="")
# useful data extraction
usefulData = cancerData[, c("Radius","Texture","Perimeter","Area","Smooth","Compact","Concavity","Concave","Symmetry","Fractal")]
predictors = names(usefulData)
# Standardized the values
means = lapply(usefulData, mean)
sd = lapply(usefulData, sd)
usefulData = (usefulData - means) / sd
#featData = usefulData
usefulData[, "Diagnostic"] = cancerData[, "Diagnostic"]
summary(usefulData)
attach(usefulData)

# perform logistic regression
glm.mod <- glm(Diagnostic~., data=usefulData, family=binomial)
summary(glm.mod)
# most important value is "texture"

glm.mod <- glm(Diagnostic~Texture, data=usefulData, family=binomial)
summary(glm.mod)
glm.probs <- predict(glm.mod, type="response")
glm.pred = rep("B",dim(usefulData)[1])
glm.pred[glm.probs >.5] = "M"
table(glm.pred,Diagnostic)
mean(glm.pred==Diagnostic)

# Q3:
vertebralData <- read.table("VertebralData.2C.txt",header=T,sep=",")
# useful data extraction
usefulData = vertebralData[, c("Incidence", "Tilt", "Angle", "Slope", "Radius", "Degree")]

predictors = names(usefulData)
# Standardized the values
means = lapply(usefulData, mean)
sd = lapply(usefulData, sd)
usefulData = (usefulData - means) / sd
usefulData[, "Status"] = vertebralData[, "Status"]
summary(usefulData)
attach(usefulData)
glm.mod <- glm(Status~Incidence+Tilt+Angle+Slope+Radius+Degree, data=usefulData, family=binomial)
summary(glm.mod)
glm.probs <- predict(glm.mod, type="response")
contrasts(Status)
glm.pred = rep("Abnormal",dim(usefulData)[1])
glm.pred[glm.probs >.5] = "Normal"
table(glm.pred,Status)
mean(glm.pred==Status)
# error rate is 0.8483871

library(MASS)
lda.mod=lda(Status~Incidence+Tilt+Angle+Slope+Radius+Degree, data=usefulData)
summary(lda.mod)
lda.probs <- predict(lda.mod, type="response")
mean(lda.pred==Status)
# error rate is 0.6774194
