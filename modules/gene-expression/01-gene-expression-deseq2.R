#' Learning
#' https://www.bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.html
#' https://bioconductor.org/packages/release/workflows/
#' https://bioconductor.org/packages/release/workflows/html/generegulation.html
#' https://bioconductor.org/packages/release/workflows/vignettes/generegulation/inst/doc/generegulation.html
#' https://bioconductor.org/packages/release/workflows/html/variants.html
#' https://bioconductor.org/packages/release/workflows/vignettes/fluentGenomics/inst/doc/fluentGenomics.html
# BiocManager::install('tximport',version = '3.11')
# BiocManager::install('tximportData',version = '3.11')
# library("tximport")
# library("readr")
# library("tximportData")
#------------------------
#-------- GTEx 
# https://gtexportal.org/home/datasets
gtex_v8_rnaseq_gc <- readLines(
  con = 'data/gtex-rnaseq-gene-count-v8.txt'
)
#'--------PROTOTYPE
#' STRING MANIPULATION
#' 
# strsplit(x = 'RINTU', split = 'RIN')
y <- strsplit(
  x = gtex_v8_rnaseq_gc[1],
  split = 'v8'
)

z <- strsplit(x = y[[1]][3],split = '\\.')

xx <- strsplit(z[[1]][1],split = '\\_')[[1]][c(2,3)]

# # 'RINTU KUTUM'
# paste0(
#   c('RINTU','KUTUM'),
#   collapse = ' '
# )

paste0(
  xx,
  collapse = ' '
)

jaisri <- function(gtex_file){
  # stage 1
  y <- strsplit(
    x = gtex_file,
    split = 'v8'
  )
  # stage 2
  z <- strsplit(x = y[[1]][3],split = '\\.')
  # stage 3
  # xx <- strsplit(z[[1]][1],split = '\\_')[[1]][c(2,3)]
  xx <- strsplit(z[[1]][1],split = '\\_')[[1]]
  n_xx <- length(xx)
  if(n_xx == 3){
    # stage 4
    output <- paste0(
      xx[c(2,3)],
      collapse = ' '
    )
  }
  if(n_xx == 2){
    # stage 4
    output <- xx[2]
  }
  if(n_xx == 4){
    # stage 4
    output <- paste0(
      xx[c(2,3,4)],
      collapse = ' '
    )
  }
  return(output)
}

jaisri(gtex_file = gtex_v8_rnaseq_gc[1])

gtex_tissue <- c()
for(i in 1:length(gtex_v8_rnaseq_gc)){
  gtex_tissue[i] <- jaisri(gtex_file = gtex_v8_rnaseq_gc[i])
}
gtex_tissue <- gsub(' ','.',gtex_tissue)

#---------
# date 
d1 <- strsplit(gtex_v8_rnaseq_gc[1],split = "2017-06-05")

d2 <- strsplit(d1[[1]][2],split = '\\.')

d3 <- strsplit(d2[[1]][1],split = '\\_')

d3[[1]][3:4]

dd <- d3[[1]]

n_dd <- length(dd)

#-----
if( n_dd == 3){
  output <- dd[3]
}

if( n_dd == 4){
  output <- paste0(dd[c(3,4)],collapse = ' ')
}

if( n_dd == 5){
  output <- paste0(dd[c(3,4,5)],collapse = ' ')
}


#-----
# convert into a function call basabi

#----
# homework (Tue)
# create a function call dev 
# using v8_





