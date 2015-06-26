library(dplyr)

data_dir <- "~/workspace/data/names"

readYear <- function(year, folder = data_dir) {
  file <- paste(folder,"/yob", year, ".txt", sep = "")
  temp <- read.csv(file, header = FALSE, col.names = c("Name", "Sex", "Frequency"))
  temp$Year <- rep(as.numeric(year), nrow(temp))
  return(temp);
}

names <- readYear(1979)
for(y in 1980:2014) {
  names <- rbind(names, readYear(y))
}

female_names <- filter(names, Sex == "F")