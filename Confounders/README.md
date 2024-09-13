# Confounders Analysis in Colon Transverse Expression Data

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
[![DOI](https://img.shields.io/badge/DOI-10.1101%2F2024.08.24.609537-blue)](https://doi.org/10.1101/2024.08.24.609537)

This directory contains an R script to analyze potential confounders in gene expression datasets related to colon transverse tissue.

## This directory contains the following three files:

1) `Confounders_colon_transverse.r`  
 This is an R script that calculates the correlation between confounding factors and gene expression levels for switch-like genes.

2) `colon_transverse_TPM_with_Meta`  
 This is the input file for the R script. It contains TPM levels in the colon for multiple genes (columns) across multiple individuals (rows).

3) `gene_correlations_colon_transverse.csv`   
 The output of the R script when run with "colon_transverse_TPM_with_Meta" as input.

## System Requirements

- **R Version**: 4.0.0 or higher
- **Dependencies**: `dplyr` and `lsr` packages 

## Installation Guide

1. Install R from [CRAN](https://cran.r-project.org/).
2.  Install the `dplyr` and `lsr` packages:
   ```r
   install.packages(c("dplyr", "lsr"))
```
## Demo
 Run the script `Confounders_colon_transverse.r`:
   ```r
   source("Confounders_colon_transverse.r")
```
## Instructions for use
- Ensure input `colon_transverse_TPM_with_Meta` is in the same directory as the script.
- The expected output is `gene_correlations_colon_transverse.csv`.
- Expected run time: 2 seconds
