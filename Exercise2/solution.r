# Q1:
carseatDataFrame <- read.table("Carseats.txt", header=TRUE, sep="")

carseatDataFrame$Color="black"
carseatDataFrame$Color[carseatDataFrame$Price>180] = 'red'
carseatDataFrame$Color[carseatDataFrame$Price<40] = 'red'
carseatDataFrame$Color[carseatDataFrame$Sales>18] = 'red'

plot(carseatDataFrame$Sales, carseatDataFrame$Price, main = "Car seats Sales-Price Plot", xlab = "Sales", ylab = "Price", col = carseatDataFrame$Color)

# Q2:
educationDataFrame <- read.table("Education.txt", header=TRUE, sep="")
subUS <- subset(educationDataFrame, Country=="US")
subCA <- subset(educationDataFrame, Country=="Canada")

xUS <- subUS$Education
yUS <- subUS$Wage
colUS <- 'red'

xCA <- subCA$Education
yCA <- subCA$Wage
colCA <- 'blue'

plot(xUS, yUS, col= colUS, xlab = "Education", ylab = "Wage")
points(xCA, yCA, col= colCA)

legend(8, 8000, c("US", "Canada"), lwd=c(2.5,2.5), col=c("red","blue"))

# Q3:
mean20DataFrame <- read.table("Mean20.txt", header = TRUE, sep = "")
processed = subset(mean20DataFrame, !is.na(time) & time > 0) 
summary(processed$time)

# Q4:
t.test(processed$time, mu = 7.05, alternative = "two.sided")
# p-value is the possiblity observing the test result under the null hypothesis
# here p-value = 0.02178 < 0.05
# therefore, the alternative hypothesis is true, which means the true mean is not 7.05
t.test(mean20DataFrame$time, mu = 7.05, alternative = "two.sided")
# while, if using original values, the hypothesis is correct but the possibility is not high.

# Q5:
t.test(processed$time, mu = 7.05, alternative = "greater")
# the null hypothesis cannot be rejected, which means true mean is less then 7.05
# therefore, John is wrong.

