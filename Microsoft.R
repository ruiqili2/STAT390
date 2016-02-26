# initialize x to 100 0's
x <- rep(0,100)
for (i in 1:100) {
  # toggle lockers i, 2i, 3i, ... at the ith whistle
  lockers <- seq(i,100,i)
  
  # toggle lockers: 
  x[lockers] <- 1-x[lockers] 
}
# lockers that are open at the end  
open_lockers <- which(x==1)
cat(open_lockers,sep=", ") 

