# Write a function that takes a directory of data files and a threshold for complete cases and calculates
# the correlation between sulfate and nitrate for monitor locations where the number of completely observed
# cases (on all variables) is greater than the threshold. The function should return a vector of correlations
# for the monitors that meet the threshold requirement. If no monitors meet the threshold requirment, then
# the function should return a numeric vector of length 0.

# 'directory' is a character vector of length 1 indicating the location of the CSV files
# 'threshold' is a numeric vector of length 1 indicating the number of completely observed observations 
# (on all varibles) required to compute the correlationg between nitrate and sulfate; default is 0
# return a numeric vector of correlations

corr <- function(directory, threshold = 0)
{
 filename <- list.files(directory, full.names = TRUE)
 corr_value <- numeric()
 for (i in 1:332)
 { # read the data
   data <- nrow(na.omit(read.csv(filename[i])))
   if (data >= threshold)
   { # create a temporary list 
    temp_list <- na.omit(read.csv(filename[i]))
    corr_value <- c(corr_value,cor(temp_list$sulfate, temp_list$nitrate)) # compute the correlation 
   } else
   {
     next
   } 
 }
 na.omit(corr_value)
}