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
yMale <- x*398.5+24
xFemale <- seq(1:25)
yFemale <- x*397.5-563.5
lines(xMale, yMale, col="blue")
lines(xFemale, yFemale, col="red")

# conclusion:
# the wage is a linear function of eduction for both male and female.
# the linear model for male is:
# wage = education * 398.5 + 24
# the linear model for female is:
# wage = eduction * 397.5 - 563.5

# Q2:
print("Answer of question 2")
pcDateFrame <- read.table("ComputerData.txt", header=TRUE, sep="")
print("ERP should thje best variable to explain the system performances.")

# Q3:
print("Answer of question 3")
print("ERP will be my choice to explain the value of PRP, since from the Summary Statistics, ERP has the highest RPR Correlation value.")

# Q4:
# Q5:
carDateFrame <- read.table("Cars2Data.txt", header=TRUE, sep="")
summary(carDateFrame)
summaryMld <- lm(mpg~., data=carDateFrame)
summary(summaryMld)

plot(carDateFrame$mpg~carDateFrame$displacement, xlab="cylinders", ylab="mpg")
mld <- lm(mpg~cylinders, data=carDateFrame)
mld
summary(mld)
abline(mld, col="red")
# Q6:
print("year will be the variable I have to choose.")
# Q7:

