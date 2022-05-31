## Day 1 - Morning session

Hello

## Workflows

- [Basic RNA-seq processing: unix tools and IGV](http://bio.lundberg.gu.se/courses/vt13/rnaseq.html)


## Install
```{R}
# Install BiocManager
install.packages("BiocManager")

# Install tximportData for dataset for our exercise
BiocManager::install("tximportData")
BiocManager::install("tximport")

# Install TxDb.Hsapiens.UCSC.hg38.knownGene package
BiocManager::install("TxDb.Hsapiens.UCSC.hg38.knownGene")

# Install readr & jsonlite package
install.packages('readr')
install.packages("jsonlite")
BiocManager::install('DESeq2')
BiocManager::install('airway')
```

## Additional resources for RNAseq data submission

- [GEO HTS Submission](https://www.ncbi.nlm.nih.gov/geo/info/seq.html)
