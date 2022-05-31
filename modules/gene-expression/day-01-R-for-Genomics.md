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

## RNA-seq data analysis with DESeq2 
- Authors: Michael I. Love, Simon Anders, Wolfgang Huber
- [Link](https://bioconductor.github.io/BiocWorkshops/rna-seq-data-analysis-with-deseq2.html)

## Flow

- how to quantify transcript expression from FASTQ files using Salmon
- import quantification from Salmon with tximport and tximeta
- generate plots for quality control
- exploratory data analysis EDA (also using MultiQC), 
- perform differential expression (DE), 
- overlap with other experimental data, 
- build reports (using ReportingTools and Glimma). 

```{Session 01}
# Additional topics discussed 
# - Laptops, Workstations, HPC
# - conda environment
# - workflows {[snakemake](https://snakemake.github.io), [NextFlow](https://www.nextflow.io)}
# - annotations {GENCODE, https://www.gencodegenes.org/mouse/}
# - GEO HTS data submission
# - Metafile information

library("tximport")
library("jsonlite")
library("readr")
library("TxDb.Hsapiens.UCSC.hg38.knownGene")
#----------
library("tximportData")
dir <- system.file("extdata", package="tximportData")
list.files(dir)
list.files(file.path(dir,"salmon"))
#----------
file.path(dir,"samples.txt")
read.table("/Users/rintukutum/opt/anaconda3/envs/r41/lib/R/library/tximportData/extdata/samples.txt")
Line1  <- "pop,center,assay,sample,experiment,run"
Line1
strsplit(Line1,split = ',')
samples <- read.table(file.path(dir,"samples.txt"), header=TRUE)
samples
samples
#----------
file.path(dir, "salmon", samples$run, "quant.sf.gz")
samples$run
files <- file.path(dir, "salmon", samples$run, "quant.sf.gz")
files
names(files)
student<- c('a','b')
student
names(student) <- c('A','B')
student['A']
data.frame(std=student)
data.frame(S=student)
data.frame(student)
#----------
names(files) <- paste0("sample",1:6)
#---------- 
all(file.exists(files))
files
any(c(TRUE,FALSE))
all(c(TRUE,FALSE))
all(c(TRUE,TRUE))

```


## Additional resources for RNAseq data submission

- [GEO HTS Submission](https://www.ncbi.nlm.nih.gov/geo/info/seq.html)
- [Airway smooth muscle cells RNAseq](https://bioconductor.org/packages/release/data/experiment/vignettes/airway/inst/doc/airway.html)
## Useful resources
- [Cheat sheet of Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [HPC Tutorials](https://ulhpc-tutorials.readthedocs.io/en/latest/preliminaries/)
- [Carpentary lessons](https://software-carpentry.org/lessons/)
- [Carpentary lesson - HPC - Shell](http://www.hpc-carpentry.org/hpc-shell/)
