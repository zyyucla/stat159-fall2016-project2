#Read data and inspect data frame
#source("../functions/eda-functions.R")
dat<-read.csv("../../data/Credit.csv",row.names=1)
head(dat)
str(dat)
summary(dat)

#Output quantative results to the file
sub_dat<-dat[,1:6]
sink("../../data/eda-output-quantative.txt")
print ('Summary Statistics of Quantative Variables')
summary(sub_dat)
cat("\n\n")

print("Standard Deviation and IQR of Variables")
cat("\n")
stats<-data.frame(Names=c("Age","Cards","Education"
,"Income","Limit","Rating"),STD=c(sd(dat$Age),sd(dat$Cards),sd(dat$Education),sd(dat$Income),sd(dat$Limit),sd
(dat$Rating)),IQR=c(IQR(dat$Age),IQR(dat$Cards),IQR(dat$Education),IQR(dat$Income),IQR(dat$Limit),IQR(dat$Rating))
)
print.data.frame(stats)
cat("\n\n")

#Correlation Matrix
print("Correlation Matrix")
cat('\n')
#matrix correlation 
cor(sub_dat)
sink()

#save correlation matrix into binary file
matrix<-as.data.frame(cor(sub_dat))
save(matrix,file="../../data/correlation-matrix.RData")


#Create histogram of all the quantative variables 
png("../../images/histogram-balance.png")
hist(dat$Balance,main="Histogram of Balance", xlab="Balance")

png("../../images/histogram-income.png")
hist(dat$Income,main="Histogram of Income", xlab="Income")

png("../../images/histogram-limit.png")
hist(dat$Limit,main="Histogram of Limit", xlab="Limit")

png("../../images/histogram-rating.png")
hist(dat$Rating,main="Histogram of Rating", xlab="Rating")

png("../../images/histogram-cards.png")
hist(dat$Cards,main="Histogram of Cards", xlab="Cards")

png("../../images/histogram-age.png")
hist(dat$Age,main="Histogram of Age", xlab="Age")

png("../../images/histogram-education.png")
hist(dat$Education,main="Histogram of Education", xlab="Education")

#Create boxplot of all the variables
png("../../images/boxplot-income.png")
boxplot(1:100,Balance~Income,data=dat,main="Boxplot of Income",xlab="Income",ylab="Balance",col="lightblue",las=2)

png("../../images/boxplot-limit.png")
boxplot(Balance~Limit,data=dat,main="Boxplot of Limit",xlab="Limit",ylab="Balance",col="lightblue",las=2)

png("../../images/boxplot-age.png")
boxplot(Balance~Age,data=dat,main="Boxplot of Age",xlab="Age",ylab="Balance",col="lightblue",las=2)

png("../../images/boxplot-education.png")
boxplot(Balance~Education,data=dat,main="Boxplot of Education",xlab="Education",ylab="Balance",col="lightblue",las=2)

png("../../images/boxplot-rating.png")
boxplot(Balance~Rating,data=dat,main="Boxplot of Rating",xlab="Rating",ylab="Balance",col="lightblue",las=2)

png("../../images/boxplot-cards.png")
boxplot(Balance~Cards,data=dat,main="Boxplot of Cards",xlab="Cards",ylab="Balance",col="lightblue",las=2)

#Create scatterplot matrix 
png("../../images/scatterplot-matrix.png")
pairs(~Balance+Income+Limit+Rating+Cards+Age+Education,data=dat, main="Scatterplot Matrix")
dev.off()
