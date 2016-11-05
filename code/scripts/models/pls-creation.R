
#Partial Least Squares Regression Model Fitting

#install.packages("pls")
require(pls)
load("data/train-test-data.RData")


attach(data.train)
set.seed(6677)

pls.cv =plsr(Balance~., data = data.train, validation ="CV")

save(pcr.cv, file = "data/models/pls.RData")
