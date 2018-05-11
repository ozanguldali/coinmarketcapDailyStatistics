repeatValue_result <- TRUE
initialValue_result <- 1

while( repeatValue_result ) {

  coin_df_name <- paste(calledCoin, "df", sep = "-")

  if ( calledCoin %in% get(dfList[initialValue_result])$CoinName ) {
  
    dfListDateInit <- paste( substring(paste(substring(dfList[initialValue_result], c(1,5), c(4,8)), collapse="-"), c(1,8), c(7,9)), collapse = "-" )
    marketCapInit <- get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "MarketCap"]
    priceInit <- get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "Price"]
    changeRatioInit <- get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "Volume24h"]
    
    new_df <- data.frame( dfListDateInit, 
                          marketCapInit, 
                          priceInit, 
                          changeRatioInit,
                          "-")
    
    names(new_df) <- c("RecordDates", "MarketCap", "Price", "Volume24h", "ChangeRatio")
    
    repeatValue_result <- FALSE
  
  } else {
    
    initialValue_result <- initialValue_result + 1
    repeatValue_result <- TRUE
    
  }

}

if ( length(dfList) > 1 ) {
  for (i in (initialValue_result+1):length(dfList)) {
    
    if ( calledCoin %in% get(dfList[i])$CoinName ) {
    
      dfListDateNext <- paste( substring(paste(substring(dfList[i], c(1,5), c(4,8)), collapse="-"), c(1,8), c(7,9)), collapse = "-" )
  
      marketCapNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "MarketCap"]
      
      priceNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Price"]
      
      volume24hNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Volume24h"]
      
      iterationPrevious <- i-1
      repeatValue_iter <- TRUE
      while ( repeatValue_iter ) {
        if( calledCoin %in% get(dfList[iterationPrevious])$CoinName ) {
          pricePrevious <- get(dfList[iterationPrevious])[get(dfList[iterationPrevious])$CoinName==calledCoin, "Price"]
          repeatValue_iter <- FALSE
        } else if( !(calledCoin %in% get(dfList[iterationPrevious])$CoinName) ) {
          iterationPrevious <- iterationPrevious - 1
          repeatValue_iter <- TRUE
        }
      }
      
      changeRatioNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Price"] * 100 / pricePrevious
      changeRatioNext <- as.numeric(format(round(changeRatioNext, 3), nsmall = 3))
      if(changeRatioNext > 100) {
        changeRatioNext <- paste("+", changeRatioNext-100, sep = "")
      } else if (changeRatioNext < 100) {
        changeRatioNext <- paste("-", 100-changeRatioNext, "")
      } else if ( changeRatioNext == 0) {
        changeRatioNext <- "0"
      }
      changeRatioNext <- paste(changeRatioNext, "%", sep = "")
      
      temp_df <- data.frame( RecordDates = dfListDateNext, 
                             MarketCap = marketCapNext, 
                             Price = priceNext, 
                             Volume24h = volume24hNext,
                             changeRatio = changeRatioNext )
                             
      
      names(temp_df) <- c("RecordDates", "MarketCap", "Price", "Volume24h", "ChangeRatio")
      
      new_df <- rbind(new_df, temp_df)
    
    } else {
      
      next
      
    }
    
  }
}
assign(coin_df_name, new_df)