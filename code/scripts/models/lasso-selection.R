
#Lasso Regression Model Selection

load("data/models/lasso.RData")

png('images/models/lasso-plotted-lambdas.png')
plot(lasso.cv)
dev.off()

attach(data.train)

lasso.lamb <- glmnet(model.matrix(Balance ~ ., data.train),
                     Balance, alpha = 1, intercept = FALSE, standardize = FALSE,
                     lambda = lasso.cv$lambda.min)

lasso.pred <- predict(lasso.lamb, 
                      newx = model.matrix(data.test$Balance ~., data.test))


lasso.mse <- mean((lasso.pred - data.test$Balance)^2)

data <- read.csv("data/Scaled-credit.csv", header = TRUE)
data <- data[,3:14]

lasso.final <- glmnet(model.matrix(data$Balance ~ ., data),
                      data$Balance, alpha = 1, intercept = FALSE, standardize = FALSE,
                      lambda = lasso.cv$lambda.min)

save(lasso.mse, lasso.final, file = "data/models/lasso-outputs.RData")

