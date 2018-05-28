repeatValue_invest <- TRUE

while ( repeatValue_invest ){
  
  if ( adminProcess == "investigate" ){
    adminInvest <- "yes"
  } else if ( adminProcess == "update" ){
    adminInvest <- readline( prompt = "Would you like to investigate the dataframes: ")
  } else {
    
    print("Please check if the application has been loaded successfully!..")
    quit(save = "no", status = 0, runLast = TRUE)
    
  }
  
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
