libDirOld <- toString(getwd())
libDirOld <- paste(libDirOld, "lib", sep = "/")

listFiles <- list.files(path = libDirOld, pattern = "\\.RData", all.files = FALSE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

if ( length(listFiles) > 0 ) {
  
  oldFile <- toString( max(listFiles) )
  
  currentDate <- Sys.Date()
  currentDateString <- gsub("-", "", currentDate)
  
  currentWorkspaceFolder <- paste(paste("20180227", currentDateString, sep = "-"), "coins_df.RData", sep = "_")
  
  if ( currentWorkspaceFolder == oldFile ) {
    
    print("The workspace is already up-to-date!")
    keepGoing <- FALSE

  } else {
    
    oldFileWorkspaceName <- paste(libDirOld, oldFile, sep = "/")
    load(toString(oldFileWorkspaceName))
    keepGoing <- TRUE
    
  }
  
  
} else {
  
  print("FATAL ERROR!")
  print("Your database does not include any workspace...")
  quit(save = "no", status = 0, runLast = TRUE)
  
}