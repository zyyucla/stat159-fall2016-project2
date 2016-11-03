
#Training and Test data separation function

#Inputs: 

#Seed to be fed into the set.seed function
#Desired size of Training set
#Matrix of data

#Output:

#list containing the training set in the first partition and the test set in the second.
#easy conversion back to data.frame afterwards!

train.test <- function(seed, size, data){
  
  set.seed(seed)
  sample.set <- sample(dim(data)[1], size)
  data.train <- data[sample.set,]
  data.test <- data[-sample.set,]
  
  list(data.train, data.test)
}


#Converting from list back to data.frame objects:

#data.list <- train.test(seed, size, data)

#data.train <- as.data.frame(data.list[1])
#data.test <- as.data.frame(data.list[2])

