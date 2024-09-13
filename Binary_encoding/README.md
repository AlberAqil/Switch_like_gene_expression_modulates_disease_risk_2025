This directory contains the following four files:

1) Binary_encoding.r  
 This R script is written to to convert the continuous but bimodal distribution of gene expression levels into binary on/off states, such that the switch-like gene is
either classified as on or off in a given individual depending on whether their TPM level is above or below a switching threshold.

3) stomach_bimodal_genes_TPM  
 This is the input file for the R script. It contains TPM levels in the stomach for switch-like genes from multiple individuals.

4) gene_dip_positions_stomach.csv  
 An intermediate file containing the positions of the "dip", i.e., the switching threshold.

5) Binary_encoding_stomach.tsv
   The output file.
