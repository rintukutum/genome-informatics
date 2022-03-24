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