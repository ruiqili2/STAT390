# Set input and output filenames
inputfile <- 'HW_scores_for_code_validation.csv'
outputfile <- 'HW_averages_for_code_validation.csv'

# Load data from inputfile
hw <- read.csv(inputfile,check.name=FALSE)
hw_t<-read.csv(inputfile,check.name=T)
colnames(hw)==colnames(hw_t)

#check for missing values
sum(is.na(hw))

# Set blank fields to 0 instead of NAs
hw[is.na(hw)] <- 0

#check that all NAs have been removed
sum(is.na(hw))

# Determine the number of HW from the number of columns
n_hw <- (ncol(hw)-1)/2

# Extract hw names from columns 2, 4, 6, ..., 2*n_hw
hw_names <- names(hw)[seq(2,2*n_hw,2)]

# Calculate % of hw scores
for (i in 1:n_hw) {
  newcol_name <- paste(hw_names[i],'[Total Pts: 100]')
  hw[[newcol_name]] <- hw[,2*i]/hw[,2*i+1]*100
}

#check the total number of columns
ncol(hw)

# Calculate HW average
n1 <- 2*n_hw+2   # col index of the first HW % scores
n2 <- 3*n_hw+1   # col index of the last HW % scores
for (i in 1:nrow(hw)) {
  sort_increase<-sort(hw[i,n1:n2])
  sorted<-sort_increase[1,3:ncol(sort_increase)]
  hw[["HW Average (Drop)"]][i] <- rowMeans(sorted)
  #[["HW Average"]][i] <- rowMeans(hw[i,n1:n2])#sum(hw[i,n1:n2])/n_hw
  hw[["Bonus"]][i]<-sum(sort_increase[1,1:2])/10
}

# Round scores to 2 decimal places
hw[,n1:(n2+2)] <- round(hw[,n1:(n2+2)],2)

# Output to csv file
write.csv(hw[,c(1,n1:(n2+2))], outputfile, row.names=FALSE)


