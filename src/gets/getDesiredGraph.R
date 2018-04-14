repeatValue_graph <- TRUE

while (repeatValue_graph) {
  
  ifGraph <- NULL
  ifGraph <- readline(prompt = "Would you like to investigate the coin datas as graphics: ")
  
  if ( ifGraph == 'yes' ) {
    repeatValue_graph <- FALSE
    source('src/gets/getDesiredGraphColumn.R')
  } else if ( ifGraph == 'no') {
    repeatValue_graph <- FALSE
  } else {
    print("Please answer as \"yes\" or \"no\".")
    repeatValue_graph <- TRUE
  }
  
}