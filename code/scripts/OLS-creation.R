
#OLS - Multiple Linear Regression Model

attach(data.train)

OLS <- lm(Balance~., data=data.train)
OLS.summ <- summary(OLS)

save(OLS, OLS.summ, file = "data/models/OLS.RData")
