# Confounders Analysis in Colon Transverse Expression Data

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
[![DOI](https://img.shields.io/badge/DOI-10.1101%2F2024.08.24.609537-blue)](https://doi.org/10.1101/2024.08.24.609537)

This directory contains an R script to correct for the effects of confounders on TPM levels.

## This directory contains the following three files:

1) `GAM.r`  
 This R script corrects raw log(TPM + 1) for condfounders using residuals from generalized additive models. Instead of using raw confounders, we use PCs derived from confounders to avoid multicollinearity.

2) `pca_pancreas.csv`  
 This is the first input file for the R script. It contains PC scores derived from the confounder matrix for each individual in pancreas.

3) `Pancreas_RawTPM_Input_Testing`
   This is the second input file for the R script. It contains the Raw TPM levels for five test genes.

4) `Pancreas_RawTPM_Output_Testing`
   This is the expected output file containing the confounder-corrected log(TPM + 1) levels.


## System Requirements

- **R Version**: 4.0.0 or higher
- **Dependencies**: `dplyr`, `mgcv`, and `data.table` packages 

## Installation Guide

1. Install R from [CRAN](https://cran.r-project.org/).
2.  Install the `dplyr`, `mgcv`, and `data.table` packages:
   ```r
   install.packages(c("dplyr", "mgcv", "data.table"))
```
## Demo
 Run the script `GAM.r`:
   ```r
   source("GAM.r")
```
## Instructions for use
- Ensure inputs are in the same directory as the script.
- The expected output is `Pancreas_RawTPM_Output_Testing`.

