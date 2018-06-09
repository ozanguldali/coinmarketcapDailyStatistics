while (repeatValue_graphAgain) {
  
  if ( columnName == 'Price' ){
    onceAgain <- read_line("One more graph; but, according to \"MarketCap\" datas?: ")
  } else{
    onceAgain <- read_line("One more graph; but, according to \"Price\" datas?: ")
  }
  
  if ( onceAgain == 'yes' ) {
    repeatValue_graphAgain <- FALSE
    if ( columnName == 'Price' ) {
      columnName <- 'MarketCap'
    } else {
      columnName <- 'Price'
    }
    source('src/run/puts/graphic/graphPRoject.R')
  } else if ( onceAgain == 'no' ) {
    repeatValue_graphAgain <- FALSE
  } else {
    print("Please response as \"yes\" or \"no\"...")
    repeatValue_graphAgain <- TRUE
  }
  
}