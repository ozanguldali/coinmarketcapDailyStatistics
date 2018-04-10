repeatValue_coin <- TRUE
thisCoin <- FALSE

while ( repeatValue_coin ) {
  
  repeatValue_coinName <- TRUE
  initialValue_coin <- 1
  
  calledCoin <- readline(prompt = "Enter the coin name you'd like to investigate: ")
  
  while ( repeatValue_coinName && ( initialValue_coin <= length(dfList) ) ) {
    
    if ( calledCoin %in% get(dfList[initialValue_coin])$CoinName ) {
      repeatValue_coinName <- FALSE
      thisCoin <- TRUE
      repeatValue_coin <- FALSE
    } else {
      thisCoin <- FALSE
      initialValue_coin <- initialValue_coin + 1
      repeatValue_coinName <- TRUE
    }
    
  }
  
  if ( thisCoin ) {
    next
  } else {
    print("Unfortunately our dataframes does not include the desired coin. Please try another one...")
    repeatValue_coin <- TRUE    
  }

}