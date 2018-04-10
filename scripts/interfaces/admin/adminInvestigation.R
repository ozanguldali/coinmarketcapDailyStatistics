repeatValue_invest <- TRUE

while ( repeatValue_invest ){
  
  adminInvest <- readline( prompt = "Would you like to investigate the dataframes: ")
  
  if ( adminInvest == "yes" ){
    
    adminCont <- TRUE
    repeatValue_invest <- FALSE
    
  } else if ( adminInvest == "no" ) {
    
    adminCont <- FALSE
    repeatValue_invest <- FALSE
    
  } else {
    
    print("Please enter only \"yes\" or \"no\".")
    repeatValue_invest <- TRUE
    
  }
  
}
