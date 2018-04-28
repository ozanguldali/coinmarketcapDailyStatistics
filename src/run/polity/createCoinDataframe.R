repeatValue_result <- TRUE
initialValue_result <- 1

while( repeatValue_result ) {

  coin_df_name <- paste(calledCoin, "df", sep = "-")

  if ( calledCoin %in% get(dfList[initialValue_result])$CoinName ) {
  
    dfListDateInit <- paste( substring(paste(substring(dfList[initialValue_result], c(1,5), c(4,8)), collapse="-"), c(1,8), c(7,9)), collapse = "-" )
    marketCapInit <- get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "MarketCap"]
    priceInit <- get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "Price"]
    dailyChangeInit <- get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "Volume24h"]
    
    new_df <- data.frame( dfListDateInit, 
                          marketCapInit, 
                          priceInit, 
                          dailyChangeInit,
                          "-")
    
    names(new_df) <- c("RecordDates", "MarketCap", "Price", "Volume24h", "DailyChange")
    
    repeatValue_result <- FALSE
  
  } else {
    
    initialValue_result <- initialValue_result + 1
    repeatValue_result <- TRUE
    
  }

}

for (i in (initialValue_result+1):length(dfList)) {
  
  if ( calledCoin %in% get(dfList[i])$CoinName ) {
  
    dfListDateNext <- paste( substring(paste(substring(dfList[i], c(1,5), c(4,8)), collapse="-"), c(1,8), c(7,9)), collapse = "-" )

    marketCapNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "MarketCap"]
    
    priceNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Price"]
    
    volume24hNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Volume24h"]
    
    dailyChangeNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Price"] * 100 / get(dfList[i-1])[get(dfList[i-1])$CoinName==calledCoin, "Price"]
    dailyChangeNext <- as.numeric(format(round(dailyChangeNext, 3), nsmall = 3))
    if(dailyChangeNext > 100) {
      dailyChangeNext <- paste("+", dailyChangeNext-100, sep = "")
    } else if (dailyChangeNext < 100) {
      dailyChangeNext <- paste("-", 100-dailyChangeNext, "")
    } else if ( dailyChangeNext == 0) {
      dailyChangeNext <- "0"
    }
    dailyChangeNext <- paste(dailyChangeNext, "%", sep = "")
    
    temp_df <- data.frame( RecordDates = dfListDateNext, 
                           MarketCap = marketCapNext, 
                           Price = priceNext, 
                           Volume24h = volume24hNext,
                           DailyChange = dailyChangeNext )
                           
    
    names(temp_df) <- c("RecordDates", "MarketCap", "Price", "Volume24h", "DailyChange")
    
    new_df <- rbind(new_df, temp_df)
  
  } else {
    
    next
    
  }
  
}
assign(coin_df_name, new_df)