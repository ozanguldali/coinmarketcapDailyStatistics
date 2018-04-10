repeatValue_result <- TRUE
initialValue_result <- 1

while( repeatValue_result ) {

  coin_df_name <- paste(calledCoin, "df", sep = "-")

  if ( calledCoin %in% get(dfList[initialValue_result])$CoinName ) {
  
    dfListDate <- paste( substring(paste(substring(dfList[initialValue_result], c(1,5), c(4,8)), collapse="-"), c(1,8), c(7,9)), collapse = "-" )
    new_df <- data.frame( dfListDate, 
                          get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "MarketCap"], 
                          get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "Price"], 
                          get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "Volume24h"])
    
    names(new_df) <- c("RecordDates", "MarketCap", "Price", "Volume24h")
    
    repeatValue_result <- FALSE
  
  } else {
    
    initialValue_result <- initialValue_result + 1
    repeatValue_result <- TRUE
    
  }

}

for (i in (initialValue_result+1):length(dfList)) {
  
  if ( calledCoin %in% get(dfList[i])$CoinName ) {
  
    dfListDate <- paste( substring(paste(substring(dfList[i], c(1,5), c(4,8)), collapse="-"), c(1,8), c(7,9)), collapse = "-" )
    temp_df <- data.frame( RecordDates = dfListDate, 
                          MarketCap = get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "MarketCap"], 
                          Price = get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Price"], 
                          Volume24h = get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Volume24h"])
    names(temp_df) <- c("RecordDates", "MarketCap", "Price", "Volume24h")
    
    new_df <- rbind(new_df, temp_df)
  
  } else {
    
    next
    
  }
  
}
assign(coin_df_name, new_df)