## Day 2 
```{R}
#------------
# load libraries
library(Rsubread)
library(limma)
library(edgeR)

#------------
# read in target file
options(digits=2)
targets <- readTargets(path='../data-4-workshop/data/')
targets

# create a design matrix
celltype <- factor(targets$CellType)
design <- model.matrix(~celltype)

# build an index for reference sequence (Chr1 in hg19)
buildindex(basename="chr1",reference="../data-4-workshop/data/hg19_chr1.fa")

# align reads
targets_inputs <- file.path('../data-4-workshop/data/',targets$InputFile)
targets_outputs <- file.path('../data-4-workshop/data/',targets$OutputFile)
  align(index="chr1",readfile1=targets_inputs,
    input_format="gzFASTQ",output_format="BAM",
    output_file=targets_outputs,
    unique=TRUE,indels=5
  )

# count numbers of reads mapped to NCBI Refseq genes
fc <- featureCounts(files=targets$OutputFile,annot.inbuilt="hg19")
x <- DGEList(counts=fc$counts, genes=fc$annotation[,c("GeneID","Length")])

# generate RPKM values if you need them
x_rpkm <- rpkm(x,x$genes$Length)

# filter out low-count genes
isexpr <- rowSums(cpm(x) > 10) >= 2
x <- x[isexpr,]

# perform voom normalization
y <- voom(x,design,plot=TRUE)

# cluster libraries
plotMDS(y,xlim=c(-2.5,2.5))

# fit linear model and assess differential expression
fit <- eBayes(lmFit(y,design))
topTable(fit,coef=2)

```
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
