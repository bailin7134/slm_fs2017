# Q1:
eduDataFrame <- read.table("Education4.txt", header=TRUE, sep="")
mEduDataFrame <- subset(eduDataFrame, Gender=="male")
fEduDataFrame <- subset(eduDataFrame, Gender=="female")

# plot the points
plot(mEduDataFrame$Education, mEduDataFrame$Wage, col="blue", xlab="Education", ylab="Wage")
points(fEduDataFrame$Education, fEduDataFrame$Wage, col="red")

# linear model
mld=lm(formula = Education~Wage, data=mEduDataFrame)
lm(formula = Education~Wage, data=fEduDataFrame)

xMale <- seq(1:25)
yMale <- xMale*398.5+24
xFemale <- seq(1:25)
yFemale <- xFemale*397.5-563.5
lines(xMale, yMale, col="blue")
lines(xFemale, yFemale, col="red")

# conclusion:
# the wage is a linear function of eduction for both male and female.
# the linear model for male is:
# wage = education * 398.5 + 24
# the linear model for female is:
# wage = eduction * 397.5 - 563.5

# Q3:
print("Answer of question 3")
pcDateFrame <- read.table("ComputerData.txt", header=TRUE, sep="")
print("ERP should thje best variable to explain the system performances.")
print("ERP will be my choice to explain the value of PRP, since from the Summary Statistics, ERP has the highest RPR Correlation value.")
mld <- lm(PRP~MYCT, data=pcDateFrame)
summary(mld)
mld <- lm(PRP~MMIN, data=pcDateFrame)
summary(mld)
mld <- lm(PRP~MMAX, data=pcDateFrame)
summary(mld)
confint(mld)
mld <- lm(PRP~CACH, data=pcDateFrame)
summary(mld)
mld <- lm(PRP~CGMIN, data=pcDateFrame)
summary(mld)
mld <- lm(PRP~CHMAX, data=pcDateFrame)
summary(mld)

# Q4:
plot(pcDateFrame$MMAX, pcDateFrame$PRP, xlab="MMAX", ylab="PRP")
abline(mld, col="red")

# Q6:
carDateFrame <- read.table("Cars2Data.txt", header=TRUE, sep="")
summaryMld <- lm(mpg~cylinders, data=carDateFrame)
summary(summaryMld)
summaryMld <- lm(mpg~displacement, data=carDateFrame)
summary(summaryMld)
summaryMld <- lm(mpg~horsepower, data=carDateFrame)
summary(summaryMld)
summaryMld <- lm(mpg~weight, data=carDateFrame)
summary(summaryMld)
confint(summaryMld)
summaryMld <- lm(mpg~acceleration, data=carDateFrame)
summary(summaryMld)
summaryMld <- lm(mpg~year, data=carDateFrame)
summary(summaryMld)
print("weight will be the variable I have to choose.")

# Q7:
plot(carDateFrame$mpg~carDateFrame$weight, xlab="weight", ylab="mpg")
mld <- lm(mpg~weight, data=carDateFrame)
mld
summary(mld)
abline(mld, col="red")

