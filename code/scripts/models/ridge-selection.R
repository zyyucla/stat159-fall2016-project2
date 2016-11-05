
#Ridge Regression Model Selection

require(glmnet)
load("data/models/ridge.RData")

png('images/models/ridge-plotted-lambdas.png')
plot(ridge.cv)
dev.off()

attach(data.train)

ridge.lamb <- glmnet(model.matrix(Balance ~ ., data.train),
                     Balance, alpha = 0, intercept = FALSE, standardize = FALSE,
                     lambda = ridge.cv$lambda.min)

ridge.pred <- predict(ridge.lamb,
                      newx = model.matrix(data.test$Balance ~., data.test))

#Tested to see if this slightly different method of prediction gave a substantially different
#result. It gives very similar results but is slightly less precise.

#set.seed(155)
#ridge.reg <- glmnet(model.matrix(Balance ~ ., data.train), Balance, alpha = 0,
#                    intercept = FALSE, standardize = FALSE, lambda = grid)

#ridge.pred2 <- predict(ridge.reg, s = ridge.cv$lambda.min,
#                       newx = model.matrix(Balance ~., data.test))

#mean((ridge.pred2 - data.test$Balance)^2)

ridge.mse <- mean((ridge.pred - data.test$Balance)^2)

data <- read.csv("data/Scaled-credit.csv", header = TRUE)
data <- data[,3:14]

ridge.final <- glmnet(model.matrix(data$Balance ~ ., data),
                     data$Balance, alpha = 0, intercept = FALSE, standardize = FALSE,
                     lambda = ridge.cv$lambda.min)

ridge.coeffs <- as.matrix(ridge.final$beta)

save(ridge.mse, ridge.final, ridge.coeffs, file = "data/models/ridge-outputs.RData")


