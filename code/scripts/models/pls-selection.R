
#Partial Least Squares Regression Model Selection

require(pls)
load("data/train-test-data.RData")
load("data/models/pls.RData")


#attach(data.train)


png('images/models/pls-plotted-components.png')
validationplot(pls.cv, val.type = "MSEP")
dev.off()

pls.index <- which.min(pls.cv$validation$PRESS)

pls.pred <- predict(pls.cv, data.test, ncomp = pls.index)

pls.mse <- mean((pls.pred - data.test$Balance)^2)

#pls.coeffs <- as.matrix(pls.cv$coefficients[,,pls.index])

data <- read.csv("data/Scaled-credit.csv", header = TRUE)
data <- data[,3:14]

pls.final <- plsr(data$Balance~., data = data, ncomp = pls.index)

pls.coeffs <- as.matrix(pls.final$coefficients[,,pls.index])

save(pls.mse, pls.final, pls.coeffs, pls.index, file = "data/models/pls-outputs.RData")

