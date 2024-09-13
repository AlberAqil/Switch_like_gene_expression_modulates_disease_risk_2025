# Switch-like Gene Expression Modulates Disease Susceptibility

This repository contains scripts and data for analyzing switch-like gene expression patterns across tissues, adjusting for confounders, and identifying sex-biased genes. These analyses were conducted as part of the study "Switch-like Gene Expression Modulates Disease Susceptibility." The scripts allow for reproducing the key results from the paper (https://www.biorxiv.org/content/10.1101/2024.08.24.609537v1).

## Repository structure

- Dip_test/: Contains the R script for conducting the dip test to identify bimodal expression.
- Sex_bias/: Contains the R script for analyzing sex-biased gene expression.
- Confounders/: Contains the R script for measuring the correlation between gene expression levels and confounding variables.
- Binary_encoding/: Contains the R script for binary encoding of gene expression states (on/off).

The README files within each directory detail the demo and instructions for use for each code.

## System Requirements:

- Operating System: Linux, macOS, or Windows
- Programming Language: R version 4.0+ is required for all scripts.
- Packages: Each subdirectory has its own list of required R packages.

## Installation

Install the required R packages as outlined in each subdirectory’s README or use the following to install all packages at once:
```r
install.packages(c("diptest", "dplyr", "readr", "effsize", "lsr"))
```
## Usage and demo

Each script in the subdirectories can be run independently, with detailed instructions provided in the respective README files with subdirectories.

## Citation

If you use this code, please cite:

Aqil, A. et al. "Switch-like Gene Expression Modulates Disease Susceptibility." BioRxiv, 2024. https://doi.org/10.1101/2024.08.24.609537

## License
This project is covered under the Apache 2.0 License.
