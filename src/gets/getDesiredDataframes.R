dateList <- seq( as.Date(startDate), as.Date(endDate), by = "days" )
dateList <- gsub("-", "", dateList)
dfList <- paste(dateList, "coins_df", sep = "-")