# Binary Encoding for Gene Expression Analysis

This repository contains an R script for performing binary encoding on gene expression data, facilitating the study of binary traits in disease models.

## This directory contains the following four files:

1) `Binary_encoding.r`  
 This R script is written to convert the continuous but bimodal distribution of gene expression levels into binary on/off states, such that the switch-like gene is
either classified as on or off in a given individual, depending on whether their TPM level is above or below a switching threshold.

2) `stomach_bimodal_genes_TPM`  
 This is the input file for the R script. It contains TPM levels in the stomach for switch-like genes from multiple individuals.

3) `gene_dip_positions_stomach.csv`  
 An intermediate file containing the positions of the "dip," i.e., the switching threshold.

4) `Binary_encoding_stomach.tsv`  
   The output file.

## System Requirements

- **R Version**: 4.0.0 or higher
- **Dependencies**: `dplyr` and `readr` packages

## Installation Guide

1. Install R from [CRAN](https://cran.r-project.org/).
2. Install the `dplyr` and `readr` packages:
   ```r
   install.packages(c("dplyr", "readr"))

## Demo

Run the script `Binary_encoding.r`:
   ```r
   source("Binary_encoding.r")
```
##Instructions for use

## Instructions for use
- Ensure the input file `stomach_bimodal_genes_TPM` is in the same directory as the script.
- The expected output: `Binary_encoding_stomach.tsv`.
- Expected run time: 9 seconds.
