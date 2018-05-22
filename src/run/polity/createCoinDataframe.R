repeatValue_result <- TRUE
initialValue_result <- 1

while( repeatValue_result ) {

  coin_df_name <- paste(calledCoin, "df", sep = "-")

  if ( calledCoin %in% get(dfList[initialValue_result])$CoinName ) {
    
    dfListDateInit <- paste( substring(paste(substring(dfList[initialValue_result], c(1,5), c(4,8)), collapse="-"), c(1,8), c(7,9)), collapse = "-" )
    if(is.na(dfListDateInit))
      dfListDateInit <- startDate
    
    marketCapInit <- get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "MarketCap"]
    if(is.na(marketCapInit))
      marketCapInit <- 0
    
    priceInit <- get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "Price"]
    if(is.na(priceInit))
      priceInit <- 0
    
    volume24hInit <- get(dfList[initialValue_result])[get(dfList[initialValue_result])$CoinName==calledCoin, "Volume24h"]
    if(is.na(dfListDateInit))
      dfListDateInit <- 0
    
    changeRatioInitString <- "initial"
    
    new_df <- data.frame( dfListDateInit, 
                          marketCapInit, 
                          priceInit, 
                          volume24hInit,
                          changeRatioInitString)
    
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
      if(is.na(dfListDateInit))
        dfListDateInit <- startDate  
      
      marketCapNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "MarketCap"]
      if(is.na(marketCapNext))
        marketCapNext <- marketCapInit
      
      priceNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Price"]
      if(is.na(priceNext))
        priceNext <- priceInit
      
      volume24hNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Volume24h"]
      if(is.na(volume24hNext))
        volume24hNext <- volume24hInit
      
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
      
      changeRatioNext <- priceNext * 100 / pricePrevious
      changeRatioNext <- as.numeric(format(round(changeRatioNext, 3), nsmall = 3))
      if(changeRatioNext > 100) {
        changeRatioNextString <- paste("+", toString(format(changeRatioNext-100, nsmall = 3)), sep = "")
      } else if (changeRatioNext < 100) {
        changeRatioNextString <- paste("-", toString(format(100-changeRatioNext, nsmall = 3)), sep = "")
      } else if ( changeRatioNext == 0) {
        changeRatioNextString <- "0"
      }
      changeRatioNextString <- paste(changeRatioNextString, "%", sep = " ")
      
      temp_df <- data.frame( RecordDates = dfListDateNext, 
                             MarketCap = marketCapNext, 
                             Price = priceNext, 
                             Volume24h = volume24hNext,
                             changeRatio = changeRatioNextString )
                             
      
      names(temp_df) <- c("RecordDates", "MarketCap", "Price", "Volume24h", "ChangeRatio")
      
      new_df <- rbind(new_df, temp_df)
    
    } else {
      
      next
      
    }
    
  }
}
assign(coin_df_name, new_df)