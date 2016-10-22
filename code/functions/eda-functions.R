#description: computes the required summary for quantitative variables
#input: a set of data
#output: a summary statistics set of the variables
 library(xtable)
quant-summary<-function(x){
   for (i in 1:6){
   var-name<-names(x)[i]
   stats<-data.frame(Quantity=c("Min: ", "Max: ", "Range: ", "Median: ", "Mean: ",
"1st Qu: ", "3rd Qu: ", "IQR: ", "STD: "), Value=c(min(x$var-name), max(x$var-name), max(x$var-name)-min(x$var-name), median(x$var-name),
 mean(x$var-name), quantile(x$var-name,0.25), quantile(x$var-name,0.75), IQR(x$var-name), sd(x$var-name)) )
   stats-table<-xtable(stats,caption=var-name,digits=4,floating=FALSE)
   print(stats-table,caption.placement="top")
   print("\n\n")
  }
}

#description: computes the frequency summary for quantitative variables
#input: the object from  "Credit.csv" set
#output: frequency summary table of all the qualitative variables

freq-summary<function(x){
  for(i in 1:4){
    var-name<-names(x)[i]
    Counts<-summary(sdata$var-name)
    Rel-Frequency<-prop.table(Counts)
    total-table<-xtable(rbind(Counts,Rel-Frequency),caption=var-name,digits=4,floating=FALSE)
    print(total-table,caption.placement="top")
    print("\n\n")
  }   
   
}
