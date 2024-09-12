
#stomach_expression_mean_gt_10 is the file containing TPM levels for various individuals in the stomach
x <- read.csv("stomach_expression_mean_gt_10", header = TRUE)
library("diptest")

result <- data.frame(
  Column = colnames(x),
  p_value = sapply(1:ncol(x), function(i) {
    dip.test(log(1+x[, i],10),simulate.p.value=TRUE,B=5000 )$p.value
  }), D = sapply(1:ncol(x), function(i) {
    dip.test(log(1+x[, i],10),simulate.p.value=FALSE )$statistic}), 
  mean_value = colMeans(log(1+x,10)),
  median_value = apply(log(1+x,10), 2, median),
  q1 = apply(log(1+x,10), 2, quantile, probs = 0.25),
  q3 = apply(log(1+x,10), 2, quantile, probs = 0.75),
  std_dev = apply(log(1+x,10), 2, sd) 
  )


write.csv(result,"Diptest_output.csv",quote=FALSE,row.names=FALSE)
