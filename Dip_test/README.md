# Dip Test for Unimodality

This directory contains the R script for performing a Dip Test of Unimodality on gene expression data to analyze disease susceptibility.

## This directory contains the following three files:

1) Diptest.r  
 This is an R script written to perform the dip test of unimodality on the TPM distribution of genes across individuals.

2) vagina_expression_GenesofInterest  
 This is the input file for the R script. It contains TPM levels in the vagina for multiple genes (columns) across multiple individuals (rows).

3) Diptest_output.csv  
 The output of the R script when run with "vagina_expression_GenesofInterest" as input.

## System Requirements

- **R Version**: 4.0.0 or higher
- **Dependencies**: `diptest` package

## Installation Guide

1. Install R from [CRAN](https://cran.r-project.org/).
2. Install the `diptest` package:
   ```r
   install.packages("diptest")
 

## Demo
```r
   source("diptest.r")
```
## Instructions for use
- Ensure input (vagina_expression_GenesofInterest) is in the same directory as the script.
- The expected output is Diptest_output.csv.
- Expected run time: 54 seconds



