
#Ridge Regression Model fitting

#install.packages("glmnet")
require(glmnet)
load("data/train-test-data.RData")
attach(data.train)

grid <- 10^seq(10, -2, length = 100)

set.seed(155)
ridge.cv <- cv.glmnet(model.matrix(Balance ~ ., data.train), Balance, alpha = 0, 
          intercept = FALSE, standardize = FALSE, lambda = grid)

save(ridge.cv, file = "data/models/ridge.RData")


