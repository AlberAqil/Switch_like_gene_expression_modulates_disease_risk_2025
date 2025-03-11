# Sex Bias Analysis in Gene Expression

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
[![DOI](https://img.shields.io/badge/DOI-10.1101%2F2024.08.24.609537-blue)](https://doi.org/10.1101/2024.08.24.609537)

This directory contains an R script for analyzing sex, age, and BMI bias in gene expression of switch-like genes.

## This directory contains the following four files:

1) `Bias.r`  
 This R script is written to determine if switch-like genes in a given tissue are sex-, age-, or BMI-biased. 

2) `processed_Meta_Cluster1_GeneTissuePairs.csv`  
 File containing confounder-corrected log(TPM+1) values for cluster-1 switch-like genes in 27 tissues across individuals. 

3) `Expression_bias_Cluster1GeneTissuePairs.csv`  
   Expected output. File containing results for sex-bias, age-bias, and BMI-bias analysis for cluster-1 gene-tissue pairs. 

## System Requirements

- **R Version**: 4.0.0 or higher
- **Dependencies**: `dplyr` and `effsize` packages

## Installation Guide

1. Install R from [CRAN](https://cran.r-project.org/).
2. Install the `dplyr` and `effsize` packages:
   ```r
   install.packages(c("dplyr", "effsize"))

## Demo
```r
   source("Bias.r")
```
## Instructions for use
- Ensure the inputs are in the same directory as the script.
- Inputs: `processed_Meta_Cluster1_GeneTissuePairs.csv`.
- The expected output: `Expression_bias_Cluster1GeneTissuePairs.csv`.
- Expected run time: 11 seconds
