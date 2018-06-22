dateList <- seq( as.Date(startDate), as.Date(endDate), by = "days" )
dateList <- gsub("-", "", dateList)

dfList <- paste(dateList, "coins_df", sep = "-")

notExist <- list()
k <- 1
for (i in (1 : length(dateList) ) ) {
  if( !exists( dfList[i] ) ) {
    notExist[[k]] <- dfList[i]
    k <- k + 1
  }
}

dfList <- dfList[ ! dfList %in% notExist ]