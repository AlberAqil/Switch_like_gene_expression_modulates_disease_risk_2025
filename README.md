# Switch-like Gene Expression Modulates Disease Risk

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.15270596-blue)](https://doi.org/10.5281/zenodo.15270596)

This repository contains scripts and data for analyzing switch-like gene expression patterns across tissues, adjusting for confounders, and identifying sex-biased genes. These analyses were conducted as part of the study "Switch-like Gene Expression Modulates Disease Risk." 

## Repository structure

- [Dip_test/](Dip_test/): Contains the R script for conducting the dip test to identify bimodal expression.
- [Sex_bias/](Sex_bias/): Contains the R script for analyzing sex-biased, age-biased, and BMI-biased gene expression.
- [Confounders/](Confounders/): Contains the R script for correcting TPM levels for the effects of confounders.


The README files within each directory detail the demo and instructions for use for each code.

## System Requirements:

- Operating System: Linux, macOS, or Windows
- Programming Language: R version 4.0+ is required for all scripts.
- Packages: Each subdirectory has its own list of required R packages.

## Clone the repository

```bash
git clone https://github.com/AlberAqil/Switch_like_gene_expression_modulates_disease_risk_2025.git
cd Switch_like_gene_expression_modulates_disease_risk_2025
```

## Installation guide

1. Install R from [CRAN](https://cran.r-project.org/).
2. Install the required R packages as outlined in each subdirectory’s README or use the following to install all packages at once:
```r
install.packages(c("diptest", "dplyr", "effsize", "mcgv", "data.table"))
```
## Usage and demo

Each script in the subdirectories can be run independently, with detailed instructions provided in the respective README files with subdirectories.

## Citation

If you use this code, please cite:

Aqil, A. et al. "Switch-like Gene Expression Modulates Disease Susceptibility." BioRxiv, 2024. https://doi.org/10.1101/2024.08.24.609537

## License
This project is covered under the Apache 2.0 License.
