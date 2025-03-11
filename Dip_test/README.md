# Dip Test for Unimodality

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
[![DOI](https://img.shields.io/badge/DOI-10.1101%2F2024.08.24.609537-blue)](https://doi.org/10.1101/2024.08.24.609537)

This directory contains the R script for performing a Dip Test of Unimodality on raw log(TPM + 1) data from the vagina.
In the study, we also performed dip test on confounder-corrected values of log(TPM + 1) using a similar script.

## This directory contains the following three files:

1) `Diptest.r`  
 This is an R script written to perform the dip test of unimodality on the TPM distribution of genes across individuals.

2) `vagina_expression_GenesofInterest`  
 This is the input file for the R script. It contains TPM levels in the vagina for multiple genes (columns) across multiple individuals (rows).

3) `Diptest_output.csv`  
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
- Ensure input `vagina_expression_GenesofInterest` is in the same directory as the script.
- The expected output is `Diptest_output.csv`.
- Expected run time: 54 seconds



