# Q1
eduData <- read.table("Education5.txt", header=TRUE, sep="")
mld=lm(formula=Wage~Education+Gender, data=eduData)
summary(mld)

# Call:
#   lm(formula = Wage ~ Education + Gender, data = eduData)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -243.473  -76.073    0.354   73.126  280.275 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
#   (Intercept) -569.784     23.100  -24.67   <2e-16 ***
#   Education    397.975      1.543  258.00   <2e-16 ***
#   Gendermale   597.904      9.173   65.18   <2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 100.1 on 494 degrees of freedom
# Multiple R-squared:  0.9931,	Adjusted R-squared:  0.9931 
# F-statistic: 3.544e+04 on 2 and 494 DF,  p-value: < 2.2e-16

# The multiple R-squared is 0.9931, which means the variables "Education" and "Gender" have a strong
# relation to "Wage"

# Q2
pcData <- read.table("ComputerData.txt", header=TRUE, sep="")
# (1)
# parameters "vendor" and "model" are not suitable to predict performance
pcData$vendor<-NULL
pcData$model<-NULL
# (2)
mld <- lm(PRP~MYCT, data=pcData)
summary(mld)$r.squared
mld <- lm(PRP~MMIN, data=pcData)
summary(mld)$r.squared
mld <- lm(PRP~MMAX, data=pcData)
summary(mld)$r.squared
mld <- lm(PRP~CACH, data=pcData)
summary(mld)$r.squared
mld <- lm(PRP~CGMIN, data=pcData)
summary(mld)$r.squared
mld <- lm(PRP~CHMAX, data=pcData)
summary(mld)$r.squared

mld <- lm(PRP~MMAX+CACH+MMIN+CHMAX+MYCT+CGMIN, data=pcData)
summary(mld)

# Call:
#   lm(formula = PRP ~ MYCT + MMIN + MMAX + CACH + CGMIN + CHMAX, 
#      data = pcData)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -195.82  -25.17    5.40   26.52  385.75 
# 
# Coefficients:
#                 Estimate Std. Error t value Pr(>|t|)    
#   (Intercept) -5.589e+01  8.045e+00  -6.948 5.00e-11 ***
#   MYCT         4.885e-02  1.752e-02   2.789   0.0058 ** 
#   MMIN         1.529e-02  1.827e-03   8.371 9.42e-15 ***
#   MMAX         5.571e-03  6.418e-04   8.681 1.32e-15 ***
#   CACH         6.414e-01  1.396e-01   4.596 7.59e-06 ***
#   CGMIN       -2.704e-01  8.557e-01  -0.316   0.7524    
#   CHMAX        1.482e+00  2.200e-01   6.737 1.65e-10 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 59.99 on 202 degrees of freedom
# Multiple R-squared:  0.8649,	Adjusted R-squared:  0.8609 
# F-statistic: 215.5 on 6 and 202 DF,  p-value: < 2.2e-16


# (3)
# Parameter "MYCT" and "CGMIN" have very little contribution on the model we build.

# (4)
# The method is, 
# 1. get the adjusted R square for each parameter
# 2. choose the parameter with biggest adjusted R square to build the model
# 3. add one of the not used parameters to the model and check the adjusted R square of
# new model, if none of them is greater than the reference model, then stop. Otherwise, 
# choose current model as reference model.
# 3. re-run step 2 until it stops

# (5)
# Pr(>|t|) demonstrates how strong each parameter has influence on the final model
# Multiple R-squared shows how good the model is to predict the performance

# Q3
plot(mld, which=1:4)
# as shown in the figures, the outliers are No. 10, No. 199, No. 200

# Q4
carData <- read.table("Cars2Data.txt", header=TRUE, sep="")
# parameters "origin" and "name" are not suitble to predict performance
carData$origin<-NULL
carData$name<-NULL

mld <- lm(mpg~cylinders, data=carData)
summary(mld)$r.squared
mld <- lm(mpg~displacement, data=carData)
summary(mld)$r.squared
mld <- lm(mpg~horsepower, data=carData)
summary(mld)$r.squared
mld <- lm(mpg~weight, data=carData)
summary(mld)$r.squared
mld <- lm(mpg~acceleration, data=carData)
summary(mld)$r.squared
mld <- lm(mpg~year, data=carData)
summary(mld)$r.squared

mld <- lm(mpg~weight+year+horsepower+acceleration+displacement+cylinders, data=carData)
plot(mld, which=1:4)