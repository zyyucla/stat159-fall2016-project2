# Read data and dummy out categorical variables
dat<-read.csv("../../data/Credit.csv")
temp_credit <- model.matrix(Balance ~ ., data = dat)
# removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[ ,-1], Balance =dat$Balance)


#scaling and centering
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)
# export scaled data
write.csv(scaled_credit, file = "../../data/Scaled-credit.csv")

