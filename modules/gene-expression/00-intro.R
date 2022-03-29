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

####-------------- Lists
# Lists are a special type of vector that can contain
# elements of different classes. Lists are a very 
# important data type in R and you should get to know 
# them well. 

# Lists can be explicitly created using the 
# list() function, which takes an arbitrary 
# number of arguments.

x <- list(1, "a", TRUE, 1 + 4i) 

####---------------- Empty list
# We can also create an empty list of a prespecified 
# length with the vector() function
x <- vector("list", length = 5)

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

# See the underlying representation of factor
unclass(x)

####---------------- Missing Values
#' Missing values are denoted by NA or NaN
#' 
#' is.na() is used to test objects if they are NA
#' 
#' is.nan() is used to test for NaN

x <- c(1, 2, NA, 10, 3)  

is.na(x)   

is.nan(x)

#' NA values have a class also, so there are integer NA, character NA, etc.
#' A NaN value is also NA but the converse is not true

x <- c(1, 2, NaN, NA, 4)

is.na(x)

is.nan(x)
