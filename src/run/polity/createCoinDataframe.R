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
    
      repeatValue_dfDate <- TRUE
      minus_dfDate <- 1
      dfListDateNext <- paste( substring(paste(substring(dfList[i], c(1,5), c(4,8)), collapse="-"), c(1,8), c(7,9)), collapse = "-" )
      while(repeatValue_dfDate){
        if(is.na(dfListDateNext)){
          if ( (i-minus_dfDate) > initialValue_result ){
            dfListDateNext <- paste( substring(paste(substring(dfList[i-minus_dfDate], c(1,5), c(4,8)), collapse="-"), c(1,8), c(7,9)), collapse = "-" )
            minus_dfDate <- minus_dfDate + 1
          } else if ( (i-minus_dfDate) == initialValue_result ){
            dfListDateNext <- dfListDateInit
          } else {
            print("FATAL ERROR!")
            quit(save = "no", status = 0, runLast = TRUE)
          }
          repeatValue_dfDate <- TRUE
        } else {
          repeatValue_dfDate <- FALSE
        }
      }
      
      repeatValue_dfMarket <- TRUE
      minus_dfMarket <- 1
      marketCapNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "MarketCap"]
      while(repeatValue_dfMarket){
        if(is.na(marketCapNext)){
          if ( (i-minus_dfMarket) > initialValue_result ){
            marketCapNext <- get(dfList[i-minus_dfMarket])[get(dfList[i-minus_dfMarket])$CoinName==calledCoin, "MarketCap"]
            minus_dfMarket <- minus_dfMarket + 1
          } else if ( (i-minus_dfMarket) == initialValue_result ){
            marketCapNext <- marketCapInit
          } else {
            print("FATAL ERROR!")
            quit(save = "no", status = 0, runLast = TRUE)
          }
          repeatValue_dfMarket <- TRUE
        } else {
          repeatValue_dfMarket <- FALSE
        }
      }
      
      repeatValue_dfPrice <- TRUE
      minus_dfPrice <- 1
      priceNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Price"]
      while(repeatValue_dfPrice){
        if(is.na(marketCapNext)){
          if ( (i-minus_dfPrice) > initialValue_result ){
            priceNext <- get(dfList[i-minus_dfPrice])[get(dfList[i-minus_dfPrice])$CoinName==calledCoin, "Price"]
            minus_dfPrice <- minus_dfPrice + 1
          } else if ( (i-minus_dfPrice) == initialValue_result ){
            priceNext <- priceInit
          } else {
            print("FATAL ERROR!")
            quit(save = "no", status = 0, runLast = TRUE)
          }
          repeatValue_dfPrice <- TRUE
        } else {
          repeatValue_dfPrice <- FALSE
        }
      }
      
      repeatValue_dfVolume <- TRUE
      minus_dfVolume <- 1
      volume24hNext <- get(dfList[i])[get(dfList[i])$CoinName==calledCoin, "Volume24h"]
      while(repeatValue_dfVolume){
        if(is.na(volume24hNext)){
          if ( (i-minus_dfVolume) > initialValue_result ){
            volume24hNext <- get(dfList[i-minus_dfVolume])[get(dfList[i-minus_dfVolume])$CoinName==calledCoin, "Volume24h"]
            minus_dfVolume <- minus_dfVolume + 1
          } else if ( (i-minus_dfVolume) == initialValue_result ){
            volume24hNext <- volume24hInit
          } else {
            print("FATAL ERROR!")
            quit(save = "no", status = 0, runLast = TRUE)
          }
          repeatValue_dfVolume <- TRUE
        } else {
          repeatValue_dfVolume <- FALSE
        }
      }
      
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