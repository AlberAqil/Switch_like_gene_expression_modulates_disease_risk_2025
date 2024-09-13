# Sex Bias Analysis in Gene Expression

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
[![DOI](https://img.shields.io/badge/DOI-10.1101%2F2024.08.24.609537-blue)](https://doi.org/10.1101/2024.08.24.609537)

This directory contains an R script for analyzing sex bias in gene expression of switch-like genes.

## This directory contains the following four files:

1) `Sexbias.r`  
 This R script is written to determine if switch-like genes in a given tissue are sex-biased. This script loops through the list of tissues shared by both sexes (NumberOfInds_per_Tissue_Non_sex_specific).
For each tissue, it processes a file containing TPM values across individuals from switch-like genes for that tissue.

2) `NumberOfInds_per_Tissue_Non_sex_specific`  
 This is the input file for the R script. It contains a list of tissues shared by both sexes.

3) `breast_mammary_tissue_bimodal_genes_TPM`  
 File containing TPM values for switch-like genes in the mammary tissue from the breast. In principle, we need a similar file for all tissues in NumberOfInds_per_Tissue_Non_sex_specific.
This file is deposited here for illustrative purposes.

4) `breast_mammary_tissue_analysis_results.csv`  
   File containing results for sex-bias analysis for the breast mammary tissue. In principle, when files containing TPM values for switch-like genes are processed for each tissue, a similar output file would be generated for each tissue. Here, we only show the output file for one tissue for illustrative purposes.

## System Requirements

- **R Version**: 4.0.0 or higher
- **Dependencies**: `dplyr`, `readr`, and `effsize` packages

## Installation Guide

1. Install R from [CRAN](https://cran.r-project.org/).
2. Install the `dplyr`, `readr`, and `effsize` packages:
   ```r
   install.packages(c("dplyr", "readr", "effsize"))

## Demo
```r
   source("Sexbias.r")
```
## Instructions for use
- Ensure the inputs are in the same directory as the script.
- Inputs: `NumberOfInds_per_Tissue_Non_sex_specific` and files similar to `breast_mammary_tissue_bimodal_genes_TPM` for each tissue in `NumberOfInds_per_Tissue_Non_sex_specific`.
- The expected output: A file similar to `breast_mammary_tissue_analysis_results.csv` for each tissue in `NumberOfInds_per_Tissue_Non_sex_specific`.
- Expected run time: 1 minute, 22 seconds
