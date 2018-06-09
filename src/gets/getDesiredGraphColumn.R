repeatValue_columnName <- TRUE

while ( repeatValue_columnName ) {

  columnName <- NULL
  columnName <- read_line("According to \"Price\" or \"MarketCap\": ")

  if ( columnName == "Price" || columnName == "MarketCap" ) {
    repeatValue_columnName <- FALSE
  } else {
    print("Unfortunately we have only \"Price\" or \"MarketCap\", please choose one of them...")
    repeatValue_columnName <- TRUE
  }
    
}
