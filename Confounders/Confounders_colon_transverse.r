
library(dplyr)
library(lsr)

# data is loaded into a dataframe called df
df <- read.table("colon_transverse_TPM_with_Meta", header=T)
# Initialize results dataframe with gene IDs
results <- data.frame(GeneID = colnames(df)[10:ncol(df)])

# Initialize vectors to store results for each variable
n_genes <- length(results$GeneID)
smtsisch_cor <- smtpax_cor <- rep(NA, n_genes)
smtsisch_p <- smtpax_p <- rep(NA, n_genes)

# Loop through each gene by column index, starting from the 10th column
for(i in 10:ncol(df)) {
  gene <- colnames(df)[i]
  
  # Apply log transformation: log10(TPM + 1)
  gene_log_transformed <- log10(df[[gene]] + 1)
  
  # Pearson correlations for continuous variables (SMTSISCH, SMTSPAX)
  
  if(!all(is.na(df$SMTSISCH))) {
    smtsisch_result <- cor.test(gene_log_transformed, df$SMTSISCH, method = "pearson", use = "complete")
    smtsisch_cor[i-9] <- smtsisch_result$estimate
    smtsisch_p[i-9] <- smtsisch_result$p.value
  }
  
  if(!all(is.na(df$SMTSPAX))) {
    smtpax_result <- cor.test(gene_log_transformed, df$SMTSPAX, method = "pearson", use = "complete")
    smtpax_cor[i-9] <- smtpax_result$estimate
    smtpax_p[i-9] <- smtpax_result$p.value
  }
  

# Combine the results into the 'results' dataframe
results <- cbind(results, 
                 SMTSISCH_Correlation = smtsisch_cor, SMTSISCH_Pvalue = smtsisch_p,
                 SMTSPAX_Correlation = smtpax_cor, SMTSPAX_Pvalue = smtpax_p,
)

# Write the results to a CSV file
write.csv(results, "gene_correlations_colon_transverse.csv", row.names = FALSE,quote =F)
