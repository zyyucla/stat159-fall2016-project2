
#Principal Component Regression Model Selection

require(pls)
load("data/train-test-data.RData")
load("data/models/pcr.RData")


#attach(data.train)


png('images/models/pcr-plotted-components.png')
validationplot(pcr.cv, val.type = "MSEP")
dev.off()

pcr.index <- which.min(pcr.cv$validation$PRESS)

pcr.pred <- predict(pcr.cv, data.test, ncomp = pcr.index)

pcr.mse <- mean((pcr.pred - data.test$Balance)^2)

#pcr.coeffs <- as.matrix(pcr.cv$coefficients[,,pcr.index])

data <- read.csv("data/Scaled-credit.csv", header = TRUE)
data <- data[,3:14]

pcr.final <- pcr(data$Balance~., data = data, intercept = TRUE, ncomp = pcr.index)


#pcr.coeffs <- as.matrix(pcr.final$coefficients[,,pcr.index])
pcr.coeffs <- as.matrix(coef(pcr.final, ncomp = pcr.index, intercept = TRUE))


save(pcr.mse, pcr.final, pcr.coeffs, pcr.index, file = "data/models/pcr-outputs.RData")

