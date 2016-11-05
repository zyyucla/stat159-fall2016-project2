
#Principal Component Regression Model Fitting

#install.packages("pls")
require(pls)
load("data/train-test-data.RData")


attach(data.train)
set.seed(25)

pcr.cv =pcr(Balance~., data = data.train, validation ="CV")

save(pcr.cv, file = "data/models/pcr.RData")
