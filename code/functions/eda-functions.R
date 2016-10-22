#description: computes the required summary for quantitative variables
#input: a quantative variable from "Credit.csv" data set
#output: a summary statistics set of the variable

quant-summary<-function(x){
   stats<-data.frame(Quantity=c("Min: ", "Max: ", "Range: ", "Median: ", "Mean: ",
"1st Qu: ", "3rd Qu: ", "IQR: ", "STD: "), Value=c(min(x), max(x), max(x)-min(x), median(x),
 mean(x), quantile(x,0.25), quantile(x,0.75), IQR(x), sd(x)) )
  
  
  

}
