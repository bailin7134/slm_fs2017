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
cv.errorSigReg <- rep(0,10)
print("signle regression time")
glm.mod1 <- glm(mpg~weight, data=usefulData)
cv.errorSigReg <- cv.glm(usefulData,glm.mod1,K=10)$delta[2]
for (i in 1:10) {
  glm.mod1 <- glm(mpg~poly(weight,i), data=usefulData)
  cv.errorSigReg[i] <- cv.glm(usefulData,glm.mod1,K=10)$delta[2]
}
cv.errorSigReg
# model 2: multiple linear regression
library(boot)
set.seed(123)
cv.errorMul1Reg <- rep(0,10)
for (i in 1:10) {
  glm.mod2 <- glm(mpg~poly(weight+year+horsepower,i), data=usefulData)
  cv.errorMul1Reg[i] <- cv.glm(usefulData,glm.mod2,K=10)$delta[2]
}
cv.errorMul1Reg
# model 3: multiple linear regression
library(boot)
set.seed(123)
cv.errorMul2Reg <- rep(0,10)
for (i in 1:10) {
  glm.mod3 <- glm(mpg~poly(weight+year+horsepower+acceleration+displacement+cylinders,i), data=usefulData)
  cv.errorMul2Reg[i] <- cv.glm(usefulData,glm.mod3,K=10)$delta[2]
}
cv.errorMul2Reg

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
usefulData[, "Diagnostic"] = cancerData[, "Diagnostic"]
summary(usefulData)
attach(usefulData)

# perform logistic regression
glm.mod <- glm(Diagnostic~., data=usefulData, family=binomial)
summary(glm.mod)
# most important value is "texture"

glm.mod <- glm(Diagnostic~Texture, data=usefulData, family=binomial)
summary(glm.mod)

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
library(MASS)
lda.fit=lda(Status~Incidence+Tilt+Angle+Slope+Radius+Degree, data=usefulData)
lda.fit
