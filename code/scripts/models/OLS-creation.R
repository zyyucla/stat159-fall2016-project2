
#OLS - Multiple Linear Regression Model

load("data/train-test-data.RData")

attach(data.train)

OLS <- lm(Balance~., data=data.train)
OLS.summ <- summary(OLS)

save(OLS, OLS.summ, file = "data/models/OLS.RData")


OLS.pred <- predict(OLS, newdata = data.test)

OLS.mse <- mean((OLS.pred - data.test$Balance)^2)

OLS.coeffs <- as.matrix(OLS.summ$coefficients[,1])


save(OLS.mse, OLS.coeffs, file = "data/models/OLS-outputs.RData")
