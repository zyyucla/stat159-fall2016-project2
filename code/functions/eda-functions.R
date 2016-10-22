#description: computes the required summary for quantitative variables
#input: the object from  "Credit.csv" set
#output: a summary statistics set of the variable

quant-summary<-function(x){
   librar(xtable)
   for (i in 2:7){
   var-name<-names(x)[i]
   stats<-data.frame(Quantity=c("Min: ", "Max: ", "Range: ", "Median: ", "Mean: ",
"1st Qu: ", "3rd Qu: ", "IQR: ", "STD: "), Value=c(min(x$var-name), max(x$var-name), max(x$var-name)-min(x$var-name), median(x$var-name),
 mean(x$var-name), quantile(x$var-name,0.25), quantile(x$var-name,0.75), IQR(x$var-name), sd(x$var-name)) )
   stats-table<-xtable(stats,caption=var-name,digits=4,floating=FALSE)
   print(stats-table,caption.placement="top")
  }
}
