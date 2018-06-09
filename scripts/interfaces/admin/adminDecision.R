repeatValue_admin <- TRUE

while ( repeatValue_admin ) {
  
  adminDecision <- read_line("Would you like to get daily coin datas (1) or investigate the current dataframes (2): " )
  
  if ( adminDecision == "1" ) {
    
    print("Dataframes are being updated...")
    adminProcess <- 'update'
    repeatValue_admin <- FALSE
    
  } else if ( adminDecision == "2" ) {
    
    adminProcess <- 'investigate'
    repeatValue_admin <- FALSE
    
  } else {
    
    print("Please press only \"1\" or \"2\"")
    repeatValue_admin <- TRUE
    
  }
  
}