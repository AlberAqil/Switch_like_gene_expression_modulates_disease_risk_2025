library(dplyr)
library(readr)
library(effsize)



tissue_names <- read.csv("NumberOfInds_per_Tissue_Non_sex_specific",header=F) %>%
  pull(1)  #the tissue names are in the first column
  
analyze_tissue <- function(tissue) {
  # Construct the file name
  file_name <- paste0(tissue, "_bimodal_genes_TPM")

  # Read the data
  data <- read_tsv(file_name)
# Splitting the data frame into a list by row
data_list <- split(data, seq(nrow(data)))
transform_row <- function(row) {
    genes <- names(row)[3:length(row)] # Adjust the index if there are more columns before gene columns
    gene_data <- stack(row[genes])
    gene_data$Name <- row$Name
    gene_data$SEX <- row$SEX
    names(gene_data) <- c("TPM", "gene", "Name", "SEX")
    return(gene_data)
}

# Apply the function to each row and combine the results
long_data <- do.call(rbind, lapply(data_list, transform_row))

  # Apply log transformation
  long_data <- long_data %>%
    mutate(log_TPM = log(TPM + 1, base = 10))

  # Perform analysis for each gene
results <- long_data %>%
    group_by(gene) %>%
    summarise(
        p_value = wilcox.test(log_TPM ~ SEX)$p.value,
        cohens_d = cohen.d(log_TPM ~ SEX)$estimate
    )


  # Write results to CSV
  write_csv(results, paste0(tissue, "_analysis_results.csv"))
}
# Use a for loop to iterate over tissue names
for (tissue in tissue_names) {
  analyze_tissue(tissue)
}
