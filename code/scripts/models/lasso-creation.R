
#Lasso Regression Model Fitting

#install.packages("glmnet")
require(glmnet)
load("data/train-test-data.RData")
attach(data.train)

grid <- 10^seq(10, -2, length = 100)

set.seed(175)
lasso.cv <- cv.glmnet(model.matrix(Balance ~ ., data.train), Balance, alpha = 1, 
                      intercept = FALSE, standardize = FALSE, lambda = grid)

save(lasso.cv, file = "data/models/lasso.RData")


