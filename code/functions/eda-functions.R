
#description: computes the frequency summary for quantitative variables
#input: one qualitative variable from dataset "Credit.csv" set
#output: frequency summary table of the variable

freq_summary<-function(x){
    library(xtable)
    name<-deparse(substitute(x)) 
    print(name)
    cat("\n")
   # stats<-data.frame(counts=c(summary(x)),rel_frequency=c(prop.table(counts)))
    counts<-summary(x)
    rel_frequency<-prop.table(counts)
    stats<-data.frame(rel_frequency,counts)   
    print.data.frame(stats)
}
