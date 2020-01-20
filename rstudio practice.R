oddcount <- function(x){
  k <- 0
  for (n in x) {
    if (n %% 2 == 1) 
      k <- k+1
  }
  return(k)
}

oddcount(c(1,3,5,6,7,8,8,12))
u <- paste("abc","de","f")  # concatenate the strings
v <- strsplit(u," ")  # split the string according to blanks
print(v)

m <- rbind(c(1,4),c(2,2))
n <- rbind(c(2,4), c(1,3))
p = m*n
print(p)