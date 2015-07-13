# Write a function named "pollutantmean" that calculates the mean of a pollutant (sulfate or nitrate)
# across a specified list of monitors. The function "pollutantmean" takes three arguments: 'directory',
# 'pollutant' and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particular
# matter data from the directory specified in the 'directory' argument and returns the mean of the
# pollutant across all of the monitors, ignoring any missing values coded as NA. 

# 'directory' is a character vector of length 1 indicating the location of the CSV file
# 'pollutant' is a character vector of length 1 indicating the name of the pollutant for which we will 
# contain the mean; either "sulfate" or "nitrate"
# return the mean of the pollutant across all the monitors list in the 'id' vector (Ignoring the NA values)
pollutantmean <- function(directory, pollutant, id = 1:332) 
{
  # files <- list.files(directory) # create a list of all the files. 
  pollutantmean_data <- NULL # store the data in a variable 
  
  for (i in 1:length(id))
  { # read the data
    path_name <- paste(directory, "/",formatC(id[i], width=3, flag=0),".csv",sep="")
    pollutantmean_data <- rbind(pollutantmean_data, na.omit(read.csv(path_name)))
  }
  sub <- subset(pollutantmean_data, select = pollutant) # create a subset set to select = pollutant
  colMeans(sub, na.rm = TRUE)   # calculate the mean of the subset
}

#sameple output:
#source("pollutantmean.R")
#pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064
#pollutantmean("specdata", "nitrate", 70:72)
## [1] 1.706
#pollutantmean("specdata", "sulfate", 23)
## [1] 1.281
