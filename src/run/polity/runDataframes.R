if ( comingFrom == "spectator" ) {

  source('src/gets/getDesiredDateInterval.R')
  
  source('src/gets/getDesiredDataframes.R')
  
  source('src/gets/getDesiredCoin.R')
  
  source('src/run/polity/createCoinDataframe.R')
  
} else {
  
  if ( adminCont ) {
    
    source('src/gets/getDesiredDateInterval.R')
    
    source('src/gets/getDesiredDataframes.R')
    
    source('src/gets/getDesiredCoin.R')
    
    source('src/run/polity/createCoinDataframe.R')
    
  } else {
    
    print("Bye...")
    quit(save = "no", status = 0, runLast = TRUE)
    
  }
  
}

