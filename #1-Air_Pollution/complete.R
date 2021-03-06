# Write a function that reads a directory full of files and reports the number of completely observed
# cases in each data file. The function should return a data frame where the first column is the name of
# the file and the second column is the number of complete cases. 

# 'directory' is a character vector of length 1 indicating the location of the CSV file
# 'id' is an integer vector indicating the monitor ID numbers to be used
# return a data frame of the form:
# id  nobs
# 1   117
# 2   1041
# ...
# where 'id' is the monitor ID number and 'nobs' is the number of complete cases
complete <- function(directory, id) 
{
  complete_data <- vector() # initialize a variable
  for (i in 1:length(id)) 
  { # find and read the data
    path_name <- c(paste(directory, "/",formatC(id[i], width=3, flag=0),".csv",sep=""))   
    data <- c(read.csv(path_name)) 
    complete_data[i] <- sum(complete.cases(data)) # add up all the complete cases 
  } 
  data <- data.frame(cbind(id,nobs=complete_data))   
  return(data)
}

#sample output 
#source("complete.R")
#complete("specdata", 1)
##   id nobs
## 1  1  117
#complete("specdata", c(2, 4, 8, 10, 12))
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96
#complete("specdata", 30:25)
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463
#complete("specdata", 3)
##   id nobs
## 1  3  243