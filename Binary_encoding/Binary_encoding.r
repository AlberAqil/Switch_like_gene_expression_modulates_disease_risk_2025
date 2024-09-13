library(dplyr)
library(ggplot2)
library(readr)



mydata <- read_tsv("stomach_bimodal_genes_TPM")
genes <- colnames(mydata)[-(1:2)] # Exclude SEX, and Name columns

# Initialize a dataframe to store results
results <- data.frame(GeneName = character(), DipPosition = numeric(), stringsAsFactors = FALSE)


for (gene in genes) {
  # Log transform TPM values
  log_tpm <- log10(mydata[[gene]] + 1)
  
  # Perform KDE
  density_est <- density(log_tpm)

  # Find local minima by identifying where the second derivative changes sign
  # Note: This simplistic approach might need refinement for complex distributions
  second_derivative <- diff(sign(diff(density_est$y)))
  minima_indices <- which(second_derivative == 2) + 1 # Adjusting index for diff
  if (length(minima_indices) > 0) {
    dip_positions <- density_est$x[minima_indices]
    # Assuming the most significant dip is what we're interested in
    main_dip <- dip_positions[which.min(density_est$y[minima_indices])]
  } else {
    main_dip <- NA # No dip found
  }
  
  # Append results
  results <- rbind(results, data.frame(GeneName = gene, DipPosition = main_dip))
}

# Write the results to a CSV file
write.csv(results, "gene_dip_positions_stomach.csv", row.names = FALSE,quote=F)




#############

 dips_data <- read_csv("gene_dip_positions_stomach.csv")

 adjusted_tpm_data <- mydata

 for (gene in colnames(mydata)[-(1:2)]) {
 dip_value <- dips_data$DipPosition[dips_data$GeneName == gene]
  
  if (length(dip_value) == 1 && !is.na(dip_value)) {
    # Apply the transformation to log(TPM+1) and compare with the dip
    adjusted_tpm_data[[gene]] <- ifelse(log10(adjusted_tpm_data[[gene]] + 1) > dip_value, 1, 0)
  } else {
    # Set the TPM values to NA if the dip value is missing or invalid
    adjusted_tpm_data[[gene]] <- NA
  }
}
write_tsv(adjusted_tpm_data, "Binary_encoding_stomach.tsv")
