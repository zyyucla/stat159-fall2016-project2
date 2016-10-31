#Read data
library(lattice)
source("../functions/eda-functions.R")
dat<-read.csv("../../data/Credit.csv",row.names=1)
summary(dat)
names(dat)
str(dat)

#Get qualitative subset of data
sub_data<-dat[,7:11]
#Output frequencies result to file
sink("../../data/eda-output-qualitative.txt")
print("Frequencies statistics of Qualitative Variables")
cat("\n\n")
freq_summary(sub_data$Married)
cat("\n")
freq_summary(sub_data$Gender)
cat("\n")
freq_summary(sub_data$Student)
cat("\n")
freq_summary(sub_data$Ethnicity)
cat("\n\n")

#Create anova
print("Anova between Balance and other qualitative variables")
cat("\n\n")
fit<-aov(Balance~Gender+Student+Married+Education, dat)
print(fit)
sink()


#Conditional Boxplots between Balance and Gender
png("../../images/conditional-boxplot-gender.png")
boxplot(Balance~Gender,dat, main="Boxplot of Balance on Gender", col="lightblue")

png("../../images/conditional-boxplot-student.png")
boxplot(Balance~Student,dat, main="Boxplot of Balance on Student", col="lightblue")

png("../../images/conditional-boxplot-married.png")
boxplot(Balance~Married,dat, main="Boxplot of Balance on Married", col="lightblue")


png("../../images/conditional-boxplot-ethnicity.png")
boxplot(Balance~Ethnicity,dat, main="Boxplot of Balance on Ethnicity", col="lightblue")



#Barchart of frequency counts
png("../../images/barchart-frequency-gender.png")
barchart(dat$Gender, main="Frequency count of Gender",xlab="Gender",ylab="Counts",col="lightblue")

png("../../images/barchart-frequency-student.png")
barchart(dat$Student, main="Frequency count of Student",xlab="Student",ylab="Counts",col="lightblue")

png("../../images/barchart-frequency-married.png")
barchart(dat$Married, main="Frequency count of Married",xlab="Married",ylab="Counts",col="lightblue")

png("../../images/barchart-frequency-ethnicity.png")
barchart(dat$Ethnicity, main="Frequency count of Ethnicity",xlab="Ethnicity",ylab="Counts",col="lightblue")
dev.off()
