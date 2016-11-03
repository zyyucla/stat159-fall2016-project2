
#Training and Test data creation

source("code/functions/train-test-function.R")
data <- read.csv("data/Scaled-credit.csv", header = TRUE)

data.list <- train.test(seed = 50, size = 300, data = data)

data.train <- as.data.frame(data.list[1])
data.train <- data.train[,3:14]
data.test <- as.data.frame(data.list[2])
data.test <- data.test[,3:14]

save(data.train, data.test, file = "data/train-test-data.RData")
