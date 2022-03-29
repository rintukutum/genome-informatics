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
