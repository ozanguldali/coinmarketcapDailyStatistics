IsDate <- function(mydate, date.format = "%Y-%m-%d") {

  return (tryCatch(!is.na(as.Date(as.character(mydate), date.format)),  
           error = function(err) {FALSE}) )  

}

read_line <- function(promptStr) {
  
  if ( interactive() ) {
    raw <- readline(prompt = promptStr)
    return(raw)
    rm(raw)  
  } else {
    cat(promptStr);
    raw <- readLines("stdin",n=1);
    return(raw)
    rm(raw)
  }
  
}

printf <- function(...) { 
  
  cat(sprintf(...))
  
}