source("Read.R")
library(ggplot2)

top_by_year <- function(yr) {
  return(head(filter(female_names, Year == yr) %>%
                arrange(desc(Frequency)), n = 10))
}

bottom_by_year <- function(yr, data = female_names) {
  #   temp <- female_names[female_names$Year == yr,]
  #   return(head(temp[order(temp$Frequency, decreasing = decreasing),], n = 10))
  return(head(filter(data, Year == yr) %>%
                arrange(Frequency), n = 10))
}

plot_name <- function(name, data = names) {
  temp <- filter(data, Name == name)
  qplot(temp$Year, temp$Frequency, color = temp$Sex, geom = "line",
        xlab = "Year", ylab = "Frequency", main = name)
}

get_common <- function(data, frq = 1000) {
  return(filter(data, data$Frequency > frq))
}

common_female <- get_common(female_names, 3000)

explore_letter <- function(letter, number = 5, data = common_female) {
  pattern <- paste("^", letter, sep = "")
  temp <- data[grep(pattern, data$Name),]
  return(sample_n(temp, number))
}

explore_common <- function(number = 5, data = common_female) {
  temp <- filter(data, data$Frequency > 1000)
  return(sample_n(temp, number))
}

contenders <- c("Hailey", "Haley", "Hayley", "Molly", "Allison", "Grace", "Hadley")
