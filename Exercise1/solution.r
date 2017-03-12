# question 1

educationDataFrame <- read.table("Education.txt", header=TRUE, sep="")
summary(educationDataFrame)

sd(educationDataFrame$ID)  # sample standard devivation
sd(educationDataFrame$Education)
sd(educationDataFrame$Gender)
sd(educationDataFrame$Wage)
sd(educationDataFrame$Country)
sqrt(mean(educationDataFrame$ID^2) - mean(educationDataFrame$ID)^2)  # population standard devivation
sqrt(mean(educationDataFrame$Education^2) - mean(educationDataFrame$Education)^2)
sqrt(mean(educationDataFrame$Gender^2) - mean(educationDataFrame$Gender)^2)
sqrt(mean(educationDataFrame$Wage^2) - mean(educationDataFrame$Wage)^2)
sqrt(mean(educationDataFrame$Country^2) - mean(educationDataFrame$Country)^2)

# question 2

usSub <- Country=="US"  # US sub
usDataFrame <- educationDataFrame[usSub,]
summary(usDataFrame)
sd(usDataFrame$Wage)  # sample standard devivation
sd(usDataFrame$Education)
sqrt(mean(usDataFrame$Wage^2) - mean(usDataFrame$Wage)^2)  # population standard devivation
sqrt(mean(usDataFrame$Education^2) - mean(usDataFrame$Education)^2)

caSub <- Country=="Canada"  # Canada sub
caDataFrame <- educationDataFrame[caSub,]
summary(caDataFrame)
sd(caDataFrame$Wage)  # sample standard devivation
sd(caDataFrame$Education)
sqrt(mean(caDataFrame$Wage^2) - mean(caDataFrame$Wage)^2)  # population standard devivation
sqrt(mean(caDataFrame$Education^2) - mean(caDataFrame$Education)^2)

#
usSub<-subset(educationDataFrame, educationDataFrame$Country=="US")
usDataFrame<-subset(usSub, usSub$Education>0 & (usSub$Gender==1 | usSub$Gender==2) & usSub$Wage>0)

# question 4

maleSub <- Gender=="1"
maleDataFrame <- educationDataFrame[maleSub,]
summary(maleDataFrame)
sd(maleDataFrame$Wage)  # sample standard devivation
sd(maleDataFrame$Education)
sqrt(mean(maleDataFrame$Wage^2) - mean(maleDataFrame$Wage)^2)  # population standard devivation
sqrt(mean(maleDataFrame$Education^2) - mean(maleDataFrame$Education)^2)

maleSub<-subset(educationDataFrame, educationDataFrame$Gender=="1")
maleDataFrame<-subset(maleSub, maleSub$Education>0 & (maleSub$Gender==1 | maleSub$Gender==2) & maleSub$Wage>0)
summary(maleDataFrame)

femaleSub <- Gender=="1"
femaleDataFrame <- educationDataFrame[femaleSub,]
summary(femaleDataFrame)
sd(femaleDataFrame$Wage)  # sample standard devivation
sd(femaleDataFrame$Education)
sqrt(mean(femaleDataFrame$Wage^2) - mean(femaleDataFrame$Wage)^2)  # population standard devivation
sqrt(mean(femaleDataFrame$Education^2) - mean(femaleDataFrame$Education)^2)

# filter all negative value in education
educationDataFrame <- read.table("Education.txt", header=TRUE, sep="")

iter = 1
val = 1
data_length = length(educationDataFrame$ID)

while(iter <= data_length)
{
  # filter wrong education & gender
  if (educationDataFrame$Education[val]<0)
  {
    print(val)
    educationDataFrame = educationDataFrame[-c(val), ]
  }
  else if (educationDataFrame$Gender[val] != 1 & educationDataFrame$Gender[val] != 2)
  {
    print(val)
    educationDataFrame = educationDataFrame[-c(val), ]
  }
  else
    val = val + 1
  
  iter = iter + 1
}
summary(educationDataFrame)