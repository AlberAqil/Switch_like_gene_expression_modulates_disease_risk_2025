library(dplyr)
library(effsize)

# Load data
file_path <- "processed_Meta_Cluster1_GeneTissuePairs.csv"
df <- read.csv(file_path, stringsAsFactors = FALSE)

# Define excluded tissues for SEX-based tests
excluded_tissues <- c("Vagina", "Uterus", "Prostate", "Ovary", "Testis")

# Function to compute statistics
compute_stats <- function(data) {
  tissue <- unique(data$Tissue)
  
  # Check if sex-based tests should be performed
  if (tissue %in% excluded_tissues) {
    cohen_d_value <- NA
    wilcox_p <- NA
  } else if (length(unique(data$SEX)) < 2) {
    cohen_d_value <- NA
    wilcox_p <- NA
  } else {
    # Compute Cohen's D
    cohen_d_value <- cohen.d(data$Expression_Level ~ data$SEX, hedges.correction = TRUE)$estimate
    
    # Compute Wilcoxon test p-value
    wilcox_test <- wilcox.test(Expression_Level ~ SEX, data = data)
    wilcox_p <- wilcox_test$p.value
  }
  
  # Pearson correlation with AGE
  age_corr <- cor.test(data$Expression_Level, data$AGE, method = "pearson")
  
  # Pearson correlation with BMI
  bmi_corr <- cor.test(data$Expression_Level, data$BMI, method = "pearson")
  
  return(data.frame(
    ENSG = unique(data$ENSG),
    Tissue = tissue,
    Cohens_D = cohen_d_value,
    Wilcoxon_p = wilcox_p,
    PearsonR_AGE = age_corr$estimate,
    Pearson_p_AGE = age_corr$p.value,
    PearsonR_BMI = bmi_corr$estimate,
    Pearson_p_BMI = bmi_corr$p.value
  ))
}

# Apply function to each gene-tissue pair
result <- df %>%
  group_by(ENSG, Tissue) %>%
  group_split() %>%
  lapply(compute_stats) %>%
  bind_rows()

# Write output without quotes and row names
write.table(result, "Expression_bias_Cluster1GeneTissuePairs.csv", sep = ",", row.names = FALSE, col.names = TRUE, quote = FALSE)

print("Processing complete. Output saved as output.csv")
