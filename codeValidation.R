### Generate fake HW scores for code validation 
rm(list=ls()) # clear working space
outputfile <- 'HW_scores_for_code_validation.csv'
nstd <- 50 # number of students
n_hw <- 14 # number of HW

# create data frame hw with username set to student001, student002, ...
hw <- data.frame(username=sprintf('student%03d',1:nstd))
hw[,2:(2*n_hw+1)] <- NA # initialize other columns to NA

# Set column names
names(hw)[1] <- "username"
for (i in 1:n_hw) {
  names(hw)[2*i] <- paste('HW',i)
  names(hw)[2*i+1] <- paste('HW',i,'max score')
}

# set max HW scores randomly between 10 and 100
set.seed(2849082)
max_scores <- sample(10:100,n_hw)            

# Assign HW scores to students according to a formula
fmax <- (1:n_hw)/n_hw
for (i in 1:nstd) {
  hw[i,seq(3,2*n_hw+1,2)] <- max_scores
  hw[i,seq(2,2*n_hw,2)] <- sample(fmax) * max_scores
}

# Output to csv file
write.csv(hw, outputfile, row.names=FALSE)

