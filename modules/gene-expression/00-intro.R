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
char_vec
rm(list = ls())
ls()

#-------------- R Objects {Vector}
x_num <- c(0.5, 0.6)       ## numeric
x_logic <- c(TRUE, FALSE)    ## logical
x_logic <- c(T, F)           ## logical
x_char <- c("a", "b", "c")  ## character
x_integer <- 9:29              ## integer
x_complex <- c(1+0i, 2+4i)     ## complex

#-------------- Mix objects
y_char <- c(1.7, "a")   ## character
y_num <- c(TRUE, 2)    ## numeric
y_char <- c("a", TRUE)  ## character

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
