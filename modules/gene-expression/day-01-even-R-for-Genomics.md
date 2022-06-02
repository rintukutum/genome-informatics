```{R}
# To run this case study, you should have R version of 4.1.0
#------------
# install packages
install.packages('BiocManager')
BiocManager::install('Rsubread')
BiocManager::install('limma')
BiocManager::install('edgeR')

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
fc <- featureCounts(files=targets_outputs,annot.inbuilt="hg19")
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
