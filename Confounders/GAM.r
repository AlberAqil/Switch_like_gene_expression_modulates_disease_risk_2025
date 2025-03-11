### Load required libraries
library(mgcv)   # For Generalized Additive Models (GAM)
library(dplyr)  # For efficient data manipulation
library(data.table)  # For fast data reading/writing

### File paths
expression_file <- "/projects/academic/omergokc/Alber/bimodality_final/pancreas/pancreas_expression_GenesofInterest"
metadata_file <- "/projects/academic/omergokc/Alber/Bimodality_Reviews/NEW_STRATEGY/PCA/pancreas/pca_pancreas.csv"

### Load data
expression_data <- fread(expression_file)
metadata <- fread(metadata_file)

### Filter metadata for pancreas tissue
metadata_filtered <- metadata 

### Filter expression_data for matching samples in metadata
# Ensure only samples present in both datasets are processed
expression_data <- expression_data %>%
  rename(SAMPID = Name) %>%  # Rename "Name" to match "SAMPID"
  filter(SAMPID %in% metadata_filtered$SAMPID)

### Merge expression data and metadata
# Join the metadata with the expression data based on `SAMPID`
merged_data <- inner_join(expression_data, metadata_filtered, by = "SAMPID")

### Variables to Correct For
# Extract confounders from metadata
confounders <- merged_data %>% select(PC1, PC2, PC3, PC4, PC5, PC6)

# Extract expression data without SAMPID and confounder columns
expression_data <- merged_data %>% select(-c(PC1, PC2, PC3, PC4, PC5, PC6))
expression_data <- expression_data %>%
  mutate(across(-SAMPID, ~ log10(. + 1)))  # Log-transform the expression values

### Filter samples with complete confounding data
complete_cases <- complete.cases(confounders)  # Identify samples with no missing data in confounders
confounders <- confounders[complete_cases, ]   # Keep only complete confounder rows
expression_data <- expression_data[complete_cases, ]  # Filter expression data to match

# Add SAMPID to track samples that made it through
SAMPID <- merged_data$SAMPID[complete_cases]

# Perform GAM to correct for confounders
adjusted_expression <- apply(expression_data[, -1], 2, function(expression) {
  # Perform GAM for each gene
  gam_model <- gam(expression ~ s(PC1) + s(PC2) + s(PC3) + s(PC4) + s(PC5) + s(PC6), data = confounders)
  residuals(gam_model)  # Extract residuals as corrected expression values
})

# Convert adjusted_expression to a dataframe
adjusted_expression <- as.data.frame(adjusted_expression)

# Attach SAMPID as the first column
adjusted_expression <- cbind(SAMPID = SAMPID, adjusted_expression)

### Save the Adjusted Expression Data
# Save the final corrected expression matrix
write.table(adjusted_expression, file = "pancreas_expression_corrected_GAM", sep = "\t", quote = FALSE, row.names = FALSE)

### End of Script
