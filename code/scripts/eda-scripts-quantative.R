##Read data and inspect data frame
source("../functions/eda-functions.R")
dat<-read.csv("../../data/Advertising.csv",row.names=1)
head(dat)
str(dat)
summary(dat)

#Output quantative results to the file
sink("../../data/eda-output.txt")
print ('Summary Statistics of Quantative Variables')
cat('\n')
quant-summary(dat)
cat("\n\n")
print("Correlation Matrix")
cat('\n')
#subset only quantative variable part for matrix correlation 
sub-var<-paste(dat,2:7,sep=" ")
sub-dat<dat[sub-var]
cor(sub-dat)
sink()

#save correlation matrix into binary file
matrix<-as.data.frame(cor(sub-dat))
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

#Create scatterplot matrix 
png("../../images/scatterplot-matrix.png")
pairs(~+dat$Balance+dat$Income+dat$Limit+dat$Rating+dat$Cards+dat$Age+dat$Education+dat$Income)
dev.off()
