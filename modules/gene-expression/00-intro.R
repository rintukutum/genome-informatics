#creating directory
dir.create('data',showWarnings = FALSE)
dir.create('figure',showWarnings = FALSE)

num_vec <- 1:100
num_vec_2 <- c(1,2,3)
rev_vec <- rev(num_vec)
char_vec <- c("a", "b", "c",4)
#vector indexing
plot(num_vec)
plot(rev_vec)

char_vec [1] <- 'b'
char_vec [2] <- 4
char_vec [3] <- 'c'
char_vec
rm(list = ls())
ls()

#-------------- R Objects {Vector}
x_num <- c(0.5, 0.6)       ## numeric
x_logic <- c(TRUE, FALSE)    ## logical
x_logic
x_logic <- c(T, F)           ## logical
T <- 'x'
T
x_char <- c("a", "b", "c")  ## character
x_integer <- 9:29              ## integer
x_complex <- c(1+0i, 2+4i)     ## complex

#-------------- Mix objects
y_char <- c(1.7, "a")   ## character
y_char
y_num <- c(TRUE, FALSE, 2)    ## numeric
y_num
y_char <- c("a", TRUE)  ## character
y_char

#---------------Matrix

matrix()
help(matrix)
set.seed(121)
rand_vec <- sample (1:10, 1000, replace = TRUE)

mat_demo <-matrix(data = rand_vec,  nrow = 100, ncol = 10, byrow = FALSE,
       dimnames = NULL)
mat_demo

mean (rand_vec)
median(rand_vec)
mean(mat_demo)
view(mat_demo)
mean(mat_demo[,1])
apply(X = mat_demo, MARGIN = 1, FUN = mean)
apply(X = mat_demo, MARGIN = 1, FUN = min)

apply(mat_demo[, 1:5], 1,mean)
apply(mat_demo[, 6:10], 1,mean)
num_demo <- c(3,2,4,5)
idx_demo <- num_demo >2
num_demo[idx_demo]
idx_demo_eq <- num_demo ==2
idx_demo_eq
num_demo [idx_demo_eq]
heatmap(mat_demo)


#-------------- Explicit Coercion Objects
x <- 0:6
class(x)
# [1] "integer"
as.numeric(x)
# [1] 0 1 2 3 4 5 6
as.logical(x)
# [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
as.character(x)
# [1] "0" "1" "2" "3" "4" "5" "6"
#----- CLASS 24 March 2022
# dreating directory
# shortcut for running the code is CTRL + ENTER (windows)
# COMMAND + ENTER
dir.create(path = 'data', showWarnings = FALSE)
dir.create(path = 'figures', showWarnings = FALSE)

#------
num_vec <- 1:100
rev_vec <- rev(num_vec)
num_vec_2 <- c(1,2,3)

char_vec <- c('a','b','c')

# c('b','a','c')
char_vec[1] <- 'b'
char_vec[2] <- 'a'
plot(num_vec)
plot(rev_vec)
plot(rev_vec)

char_vec <- c('a','b','c')


rm(list = ls())
#-------------- R Objects {Vector}
x_num <- c(0.5, 0.6)         ## numeric
x_logic <- c(TRUE, FALSE)    ## logical
x_logic2 <- c(T, F)
## logical

x_char <- c("a", "b", "c")  ## character
x_integer <- 9:29              ## integer
x_complex <- c(1+0i, 2+4i)     ## complex

#-------------- Mix objects
y_char <- c(1.7, "a")   ## character
y_num <- c(TRUE, FALSE,TRUE , 2)    ## numeric
y_char <- c("a", TRUE)  ## character

#========== MATRIX
set.seed(121)
rand_vec <- sample(x = 1:10,size = 1000,replace = TRUE)
mat_demo <- matrix(
  data = rand_vec, 
  nrow = 100, ncol = 10, byrow = FALSE,
  dimnames = NULL)
#-------
mean(rand_vec)
mean(mat_demo)
mean(mat_demo[,1])
mean(mat_demo[1,])

apply(X = mat_demo,MARGIN = 1,FUN = mean)

apply(X = mat_demo,MARGIN = 1,FUN = min)

apply(mat_demo[,1:5],1,mean)

apply(mat_demo[,6:10],1,mean)

num_demo <- c(3,2,4,5)
idx_demo <- num_demo > 2
idx_demo_eq <- num_demo == 2
num_demo[idx_demo]

num_demo[idx_demo_eq]
####
# Matrices can be created by column-binding or 
# row-binding with the cbind() and rbind() functions.
x <- 1:3
y <- 10:12
# column-binding
cbind(x, y)
# row-binding
rbind(x, y) 
x <- 1:2

t.test(x,y)

####-------------- Lists
# Lists are a special type of vector that can contain
# elements of different classes. Lists are a very 
# important data type in R and you should get to know 
# them well. 

# Lists can be explicitly created using the 
# list() function, which takes an arbitrary 
# number of arguments.

x <- list(1, "a", TRUE, 1 + 4i) 
x


####---------------- Empty list
# We can also create an empty list of a prespecified 
# length with the vector() function
x <- vector("list", length = 5)
x
x <- list()
x
####---------------- Factors
#' Factors are used to represent categorical data 
#' and can be unordered or ordered. One can think 
#' of a factor as an integer vector where each integer 
#' has a label. 
#' 
#' Factors are important in statistical 
#' modeling and are treated specially by 
#' modelling functions like lm() and glm().

#' Using factors with labels is better than using 
#' integers because factors are self-describing. 
#' Having a variable that has values “Male” and 
#' “Female” is better than a variable that has 
#' values 1 and 2.
#' 
#' Factor objects can be created with the factor() function.

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
x <- factor(c("yes", "yes", "no", "yes", "no"), levels = c('yes', 'no'))
x
Ans <- c('Y', 'N')
Name <- c ( 'AB', 'Biswajit')
DIF <- cbind(Ans, Name)
DIF
list (Ans, Name)
list(DIF)
rm(list=ls())
student <- (list('boy' = LETTERS [1:4], 'girl' = 'V'))
student
student[[1]]
# See the underlying representation of factor
unclass(x)

####---------------- Missing Values
#' Missing values are denoted by NA or NaN
#' 
#' is.na() is used to test objects if they are NA
#' 
#' is.nan() is used to test for NaN

x <- c(1, 2, NaN, 10, 3)  
x
is.na(x)   

is.nan(x)

#' NA values have a class also, so there are integer NA, character NA, etc.
#' A NaN value is also NA but the converse is not true

x <- c(1, 2, NaN, NA, 4)

is.na(x)

is.nan(x)

############---------------- DATA FRAME
#' Data frames are used to store tabular data in R. 
#' They are an important type of object in R and 
#' are used in a variety of statistical modeling 
#' applications. 
rm(list=ls())


############----------------- Names
#' R objects can have names, which is very useful
#' for writing readable code and self-describing
#' objects. Here is an example of assigning names
#' to an integer vector.
x <- 1:3
#x <- c(1,2,3,...,100)
names(x)
names(x) <- c("New York", "Seattle", "Los Angeles")
x
x[1]
#' Lists can also have names, which is often very useful.
x <- list("Los Angeles" = 1, Boston = 2, London = 3)
x
#' Matrices can have both column and row names.
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
#' Column names and row names can be set separately 
#' using the colnames() and rownames() functions.
colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m
m

###################
#'----------------- Subsetting R Objects
#' There are three operators that can be used to extract
#' subsets of R objects.
#' 
m[1,1]
#' The '[' operator always returns an object of the same 
#' class as the original. It can be used to select multiple 
#' elements of an object
#' 
#' The '[[' operator is used to extract elements of a list or 
#' a data frame. It can only be used to extract a single 
#' element and the class of the returned object will not 
#' necessarily be a list or data frame.
#' 
#' The $ operator is used to extract elements of a list or 
#' data frame by literal name. Its semantics are similar to
#' that of [[.

#' --------- Subsetting a Vector
#' Vectors are basic objects in R and they can be subsetted 
#' using the [ operator.
#' 
#' x <- c("a", "b", "c", "c", "d", "a")
#' 
#' 
#' --------- Subsetting a Matrix
#' 
#' x <- matrix(1:6, 2, 3)
#' 
#' --------- Dropping matrix dimensions
#' x <- matrix(1:6, 2, 3)
#' 
#' 
#' --------- Subsetting Lists
#' x <- list(foo = 1:4, bar = 0.6)
#' 
#' 
#' --------- Subsetting Nested Elements of a List
#' x <- list(a = list(10, 12, 14), b = c(3.14, 2.81))
#' 
#' 
#' --------- Extracting Multiple Elements of a List
#' x <- list(foo = 1:4, bar = 0.6, baz = "hello")
#' 
#' 
#' 
#' --------- Using the readr Package
install.packages('readr')

library(readr)
age_data <- read_csv(file = 'data/age.csv')
# readr::read_csv()
#' --------- Binary Formats
#' 
#' 
#' --------- Control Structures
#' 
#' --------- Commonly used control structures are
#' --------- https://bookdown.org/rdpeng/rprogdatascience/control-structures.html
#' - if and else: testing a condition and acting on it
#' - for: execute a loop a fixed number of times
#' - while: execute a loop while a condition is true
#' - repeat: execute an infinite loop (must break out of it to stop)
#' - break: break the execution of a loop
#' - next: skip an interation of a loop

# if(<condition>) {
#   ## do something
# } 

# if(<condition>) {
#   ## do something
# } 
# else {
#   ## do something else
# }

# if(<condition1>) {
#   ## do something
# } else if(<condition2>)  {
#   ## do something different
# } else {
#   ## do something different
# }

## Generate a uniform random number
set.seed(1929)
x <- runif(n = 100, min = 0, max = 10)  
if(x > 3) {
  y <- 10
} else {
  y <- 0
}
# x < 4
x_4 <- c()
j <- 1 
for( i  in 1:length(x) ){
  if( x[i] < 4 ){
    x_4[j] <- x[i]
    j <- j + 1
  }
}
#--------------------------
# x > 4
y <- c()
j <- 1 
for( i  in 1:length(x) ){
  if( x[i] > 4 ){
    y[j] <- x[i]
    j <- j + 1
  }
}


x_list <- list()
for(i in 1:5){
  if(i  == 1){
    idx <- x < 2
    x_list[[i]] <- x[idx]
  }
  if(i  == 2){
    idx <- x >= 2 & x < 4
    x_list[[i]] <- x[idx]
  }
  if(i  == 3){
    idx <- x >= 4 & x < 6
    x_list[[i]] <- x[idx]
  }
  if(i  == 4){
    idx <- x >= 6 & x < 8
    x_list[[i]] <- x[idx]
  }
  if(i  == 5){
    idx <- x >= 8
    x_list[[i]] <- x[idx]
  }
}
# #############################################
# homework 
x_bucket <- list()
bucket_id <- c()
# indicator
ind <- c(2,4,6,8,10)

for(i in 1:length(x)){
  b.index <- c(FALSE,FALSE,FALSE,FALSE,FALSE)
  for(j in 1:length(ind)){
    if(x[i] <= ind[j] & x[i] > ind[j-1]){
      # homework
      # FEEL THE MISSING CODE
    }
  }
}




for(i in 1:5){
  if(i >= 3){
    print(i)
  }
}

i <- 1:5
i[i>3]
y <- if(x > 3) {
  10
} else { 
  0
}

#--------
# https://www.routledge.com/Chapman--HallCRC-The-R-Series/book-series/CRCTHERSER
#------
# install.packages("BiocManager")
# R < 4.1.0
# BiocManager::install(version = '3.11', force = TRUE)
# BiocManager::install("DESeq2", version = '3.11')
# BiocManager::install("locfit", version = '3.11')
#------






















