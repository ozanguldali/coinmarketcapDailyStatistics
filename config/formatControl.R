IsDate <- function(mydate, date.format = "%Y-%m-%d") {

  return (tryCatch(!is.na(as.Date(as.character(mydate), date.format)),  
           error = function(err) {FALSE}) )  

}