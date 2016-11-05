
#OLS - Multiple Linear Regression Model

#change to just fit over all data?

load("data/train-test-data.RData")

data <- read.csv("data/Scaled-credit.csv", header = TRUE)
data <- data[,3:14]

OLS <- lm(Balance~., data=data.train)
OLS.summ <- summary(OLS)

save(OLS, OLS.summ, file = "data/models/OLS.RData")


OLS.pred <- predict(OLS, newdata = data.test)

OLS.mse <- mean((OLS.pred - data.test$Balance)^2)

OLS.coeffs <- as.matrix(OLS.summ$coefficients[,1])


save(OLS.mse, OLS.coeffs, file = "data/models/OLS-outputs.RData")
